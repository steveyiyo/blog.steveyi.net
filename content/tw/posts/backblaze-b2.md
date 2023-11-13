---
title: 'Backblaze B2 低價的雲端數據存儲服務'
author: "SteveYi"
date: Mon, 11 May 2020 09:35:00 +0000
draft: false
categories: ["科技"]
tags: ["對象存處", "網站日誌"]
---

之前學習建站之時，考量到一個問題！  
如果今天我的流量暴漲，文章變多，我的圖片空間及流量會不會也跟著變多  
所以在網路上搜尋了一些對象存處服務，找到了一間便宜的對象存處提供商－[Backblaze](https://www.backblaze.com/)

什麼是對象存處
-------

對象存處是一種數據存儲，其中每個數據單元存儲為稱為對象的離散單元。  
對象靜態文件，類似於 pdf，mp3 檔，圖片或影片...等文件。  
這些對象實際上可以是任何類型的數據和任何大小的數據。  
對象存儲中的所有對像都存儲在單個平面地址空間中，而沒有文件夾層次結構。

比較知名的提供商有 [AWS S3](https://aws.amazon.com/s3/)、[Google Cloud Storage](https://cloud.google.com/storage)、[Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html)、[DigitalOcean Space](https://www.digitalocean.com/products/spaces/)...等等

那這次要介紹的則是 Backblaze B2

Backblaze B2 的優勢
---------------

[Backblaze B2 的價格是 Amazon S3 的 ¼ 倍  
](https://www.backblaze.com/b2/cloud-storage-pricing.html)[搭配 CloudFlare CDN 免流量費  
](https://www.cloudflare.com/bandwidth-alliance/backblaze/)[支持 S3 API](https://www.backblaze.com/blog/backblaze-b2-s3-compatible-api/)

註冊帳號
----

首先，進入官網後，點擊右上角的 Sign Up

![](https://static-a1.steveyi.net/media/blog/2020051108120980.png)

接著輸入帳號密碼，選擇資料放置區域(基本上選擇美西)

![](https://static-a1.steveyi.net/media/blog/2020051108143529.png)

接著到電子郵件中驗證帳號！完成

![](https://static-a1.steveyi.net/media/blog/2020051108170997.png)

創建 Bucket
--------

登入帳號後，點擊中間的 Creat a Bucket

接著輸入 Bucket 名稱，不可以跟別人重複  
接著選擇 Public (如果你用於備份, 私人檔案的話，就選擇 Private )

![](https://static-a1.steveyi.net/media/blog/2020051108354195.png)

接著我們就會看見剛剛創建的 Bucket 了

![](https://static-a1.steveyi.net/media/blog/2020051109002920.png)

創建 App Key
---------

雖然說在網頁上我們就可以上傳檔案了，但是網頁只支持到 500MB 的檔案  
超過就必須要使用 API 上傳了，所以這邊我們來教大家怎麼建立App Key

首先，點擊左方的 App Keys

![](https://static-a1.steveyi.net/media/blog/2020051109051012.png)

接著我們點擊 Add a New Application Key

![](https://static-a1.steveyi.net/media/blog/2020051109090292.png)

輸入 App Key 名稱，允許訪問的 Bucket  
接著點選 Create a new key

![](https://static-a1.steveyi.net/media/blog/2020051109160381.png)

接著會產生 API 資訊，將 S3 EndPoint, Key ID 及 applicationKay 記下來

![](https://static-a1.steveyi.net/media/blog/2020051109185118.png)

上傳/下載檔案
-------

在Windows/Mac上傳或下載有很多種工具可以做，我比較推薦使用 [Cyberduck](https://cyberduck.io/)  
如果是Linux的話，我認為 [Rclone](https://rclone.org) 是一個好選擇

PS.可以選擇 S3 API 或是 Backblaze API 進行連接

總結
--

Backblaze 真的是我找到最實惠的靜態存處服務  
價格超優！而且可以搭配 Cloudflare 綁定自訂網域及 CDN  
不知道大家有沒有發現，本站的圖片皆是放置在 Backblaze 並啟用 Cloudflare CDN 加速唷！
