---
title: 'Backblaze B2 搭配 Cloudflare Workers 設定自訂網域名稱'
date: Wed, 26 Feb 2020 20:36:28 +0000
draft: false
tags: ['伺服器', '網站日誌', 'CDN']
---

當初架設網站的時候，考量到了圖片的存儲以及流量的問題

本來是將圖片跟網站放在同一個網站伺服器下的，但後來發現伺服器空間常常不足夠（因為系統會自動備份，導致空間不足）

後來將圖片放在 [OneDrive](https://onedrive.com) 商業版，並搭配 [OneList](https://github.com/MoeClub/OneList/) 來使用，但畢竟是非官方的API，當API請求速率過快，圖片就載入不出來了．

當初 [OneDrive](https://onedrive.com) 失敗後，又將圖片放到 [Google Drive](https://drive.google.com) 上，並搭配 [rclone](https://rclone.org) 使用，  
但是... 網站載入爆慢呀！（而且流量也爆了）  
最後就發現 [Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html) 這個東西了 XD

# Backblaze 是什麼?

Backblaze 是一家數據存儲提供商，提供兩種產品：
- [B2 Cloud Storage](https://www.backblaze.com/b2/cloud-storage.html) 是一種類似於 Amazon S3 的對象存儲服務，主打低價，並且搭配 Cloudflare CDN 的 egree 流量為免費！
- [Cloud Backup](https://www.backblaze.com/cloud-backup.html) 則是無限空間的電腦備份服務。

如果有興趣了解更多內容的話，可以參考 [Backblaze官網](https://www.backblaze.com)。

# 需要運用到的資源

- Cloudflare CDN
- Cloudflare DNS
- Cloudflare Workers
- Backblaze B2

# 教學開始

1.首先，進入 Cloudflare 後，點擊 `+ Add a Site` 來新增一個網域

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-01-1920x1082.png)

2.新增完成之後，我們點擊右方的 Workers 來進入Cloudflare Workers  
接著我們點擊上方的 Create a Worker 來建立一個新的 Worker

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-02-1920x407.png)

3.將文章下方的程式碼貼到左邊的 Script，並修改以下三個參數：

- b2Domain
- b2Bucket
- b2UrlPath  

完成後我們點擊下方的 Save and Deploy。

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-03-1920x967.png)

4.接著我們進入剛剛新增好的網域  
新增一個 CNAME 紀錄（下方是 A 紀錄... 忘了改 xDD）

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-04-1920x469.png)

5.新增 CNAME 紀錄後，我們點擊上方的 Workers  
接著點擊 Add route

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-05-1920x693.png)

6.接著這邊我們來設定一下  

1. Route 的部分填寫 `剛剛新增的子網域/*` 
e.g. `img.steveyi.net/*  `
2. Worker 選擇剛剛新增的 Worker

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-06.png)

這樣就大功告成啦！

# Cloudflare Workers 程式碼

[程式碼作者 / 來源](https://jross.me/free-personal-image-hosting-with-backblaze-b2-and-cloudflare-workers/)

```javascript
'use strict';
const b2Domain = 'static-a1.steveyi.net'; //你要在 Cloudflare 上綁定的 Backblaze 網域
const b2Bucket = ''; //Backblaze B2 的存儲桶名稱
const b2UrlPath = `/file/${b2Bucket}/`;
addEventListener('fetch', event => {
    return event.respondWith(fileReq(event));
});

// define the file extensions we wish to add basic access control headers to
const corsFileTypes = ['png', 'jpg', 'gif', 'jpeg', 'webp'];

// backblaze returns some additional headers that are useful for debugging, but unnecessary in production. We can remove these to save some size
const removeHeaders = [
    'x-bz-content-sha1',
    'x-bz-file-id',
    'x-bz-file-name',
    'x-bz-info-src_last_modified_millis',
    'X-Bz-Upload-Timestamp',
    'Expires'
];
const expiration = 31536000; // override browser cache for images - 1 year

// define a function we can re-use to fix headers
const fixHeaders = function(url, status, headers) {
    let newHdrs = new Headers(headers);
    // add basic cors headers for images
    if (corsFileTypes.includes(url.pathname.split('.').pop())) {
        newHdrs.set('Access-Control-Allow-Origin', '*');
    }
    // override browser cache for files when 200
    if (status === 200) {
        newHdrs.set('Cache-Control', "public, max-age=" + expiration);
    } else {
        // only cache other things for 5 minutes
        newHdrs.set('Cache-Control', 'public, max-age=300');
    }
    // set ETag for efficient caching where possible
    const ETag = newHdrs.get('x-bz-content-sha1') || newHdrs.get('x-bz-info-src_last_modified_millis') || newHdrs.get('x-bz-file-id');
    if (ETag) {
        newHdrs.set('ETag', ETag);
    }
    // remove unnecessary headers
    removeHeaders.forEach(header => {
        newHdrs.delete(header);
    });
    return newHdrs;
};
async function fileReq(event) {
    const cache = caches.default; // Cloudflare edge caching
    const url = new URL(event.request.url);
    if (url.host === b2Domain && !url.pathname.startsWith(b2UrlPath)) {
        url.pathname = b2UrlPath + url.pathname;
    }
    let response = await cache.match(url); // try to find match for this request in the edge cache
    if (response) {
        // use cache found on Cloudflare edge. Set X-Worker-Cache header for helpful debug
        let newHdrs = fixHeaders(url, response.status, response.headers);
        newHdrs.set('X-Worker-Cache', "true");
        return new Response(response.body, {
            status: response.status,
            statusText: response.statusText,
            headers: newHdrs
        });
    }
    // no cache, fetch image, apply Cloudflare lossless compression
    response = await fetch(url, { cf: { polish: "lossless" } });
    let newHdrs = fixHeaders(url, response.status, response.headers);

    if (response.status === 200) {

        response = new Response(response.body, {
            status: response.status,
            statusText: response.statusText,
            headers: newHdrs
        });

    } else {
    // 可以返回 404 的 HTML
        response = new Response(`<!--
        SteveYi 個人網站
        https://steveyi.net/
    
        Developed by SteveYi
        https://about.steveyi.net
    -->
    
    <!DOCTYPE html>
    <html lang="en">
    
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="https://static.yiy.tw/media/logo/Yi_logo.png" type="images/x-icon">
        <title>你來到了一個錯誤頁面</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:500" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web:700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
        <style>
            * {
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
            }
            
            body {
                padding: 0;
                margin: 0;
            }
            
            #notfound {
                position: relative;
                height: 100vh;
            }
            
            #notfound .notfound {
                position: absolute;
                left: 50%;
                top: 50%;
                -webkit-transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
            }
            
            .notfound {
                max-width: 767px;
                width: 100%;
                line-height: 1.4;
                padding: 0px 15px;
            }
            
            .notfound .notfound-404 {
                position: relative;
                height: 150px;
                line-height: 150px;
                margin-bottom: 25px;
            }
            
            .notfound .notfound-404 h1 {
                font-family: 'Titillium Web', sans-serif;
                font-size: 186px;
                font-weight: 900;
                margin: 0px;
                text-transform: uppercase;
                background: url('https://static.yiy.tw/media/assect/text.png');
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-size: cover;
                background-position: center;
            }
            
            .notfound h2 {
                font-family: 'Noto Sans TC', sans-serif;
                font-size: 26px;
                font-weight: 700;
                margin: 0;
            }
            
            .notfound p {
                font-family: 'Noto Sans TC', sans-serif;
                font-size: 14px;
                font-weight: 500;
                margin-bottom: 0px;
                text-transform: uppercase;
            }
            
            .notfound a {
                font-family: 'Noto Sans TC', sans-serif;
                display: inline-block;
                text-transform: uppercase;
                color: #fff;
                text-decoration: none;
                border: none;
                background: #5c91fe;
                padding: 10px 40px;
                font-size: 14px;
                font-weight: 700;
                border-radius: 1px;
                margin-top: 15px;
                -webkit-transition: 0.2s all;
                transition: 0.2s all;
            }
            
            .notfound a:hover {
                opacity: 0.8;
            }
            
            @media only screen and (max-width: 767px) {
                .notfound .notfound-404 {
                    height: 110px;
                    line-height: 110px;
                }
                .notfound .notfound-404 h1 {
                    font-size: 120px;
                }
            }
        </style>
    </head>
    
    <div id="notfound">
        <div class="notfound">
            <div class="notfound-404">
                <h1>404</h1>
            </div>
            <h2>糟糕! 我們好像找不到檔案或頁面！</h2>
            <p>抱歉，您要查找的檔案或頁面不存在，可能被刪除或是暫時不可使用</p>
            <a href="https://steveyi.net/">回到主頁</a>
        </div>
    </div>
    
    </html>`, {
            headers: {
                'content-type': 'text/html;charset=UTF-8',
            },
            status: 404
        })
    }

    event.waitUntil(cache.put(url, response.clone()));
    return response;
}
```

# Refence:

1.  [Using Backblaze B2 and Cloudflare Workers for free image hosting](https://jross.me/free-personal-image-hosting-with-backblaze-b2-and-cloudflare-workers/)
2.  [Bandwidth Alliance | BACKBLAZE](https://www.cloudflare.com/bandwidth-alliance/backblaze/)
3.  [Backblaze and Cloudflare Partner to Provide Free Data Transfer](https://www.backblaze.com/blog/backblaze-and-cloudflare-partner-to-provide-free-data-transfer/)