---
title: 'Backblaze B2 和 Cloudflare Workers 設定自訂域名'
date: Wed, 26 Feb 2020 20:36:28 +0000
draft: true
tags: ['伺服器', '網站日誌']
---

**前言**
======

當初架設網站的時候，考量到了圖片的存儲以及流量的問題

本來是將圖片跟網站放在同一個網站伺服器下的，但後來發現伺服器空間常常不足夠（因為系統會自動備份，導致空間不足）

後來將圖片放在[OneDrive](https://onedrive.com)商業版，並搭配[OneList](https://github.com/MoeClub/OneList/)來使用，但畢竟是非官方的API，當API請求速率過快，圖片就載入不出來了．

當初[OneDrive](https://onedrive.com)失敗後，又將圖片放到[Google Drive](https://drive.google.com)上，並搭配[rclone](https://rclone.org)使用，  
但是...網站載入爆慢呀！（而且流量也爆了）  
最後就發現[Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html)這個東西了XD

Backblaze是什麼?
=============

Backblaze是一家數據存儲提供商，提供兩種產品  
[B2 Cloud Storage](https://www.backblaze.com/b2/cloud-storage.html)(一種類似於Amazon S3的對象存儲服務)  
[Cloud Backup](https://www.backblaze.com/cloud-backup.html)(無限空間的電腦備份服務)  
  
其中 [B2 Cloud Storage](https://www.backblaze.com/b2/cloud-storage.html) 主打低價 (搭配Cloudflare CDN流量免費)，[Cloud Backup](https://www.backblaze.com/cloud-backup.html)主打無限空間備份  
  
更多內容可以參考 [Backblaze官網](https://www.backblaze.com)

**需要運用到的資源**
============

Cloudflare CDN

Cloudflare DNS

Cloudflare Workers

Backblaze B2

**教學開始**
========

1.首先，進入Cloudflare後 點擊 +Add a Site 新增一個網域

![](https://static.yiy.tw/media/blog/2020/04/B2-CFWorkers-01-1920x1082.png)

2.新增完之後，我們點擊右方的Workers  
來進入Cloudflare Workers  
接著我們點擊上方的 Create a Worker 來建立一個新的Worker

![](https://static.yiy.tw/media/blog/2020/04/B2-CFWorkers-02-1920x407.png)

3.將文章下方的程式碼貼到左邊的Script  
並修改 b2Domain b2Bucket b2UrlPath  
完成後我們點擊下方的Save and Deploy

![](https://static.yiy.tw/media/blog/2020/04/B2-CFWorkers-03-1920x967.png)

4.接著我們進入剛剛新增好的網域  
新增一個CNAME紀錄(下方是A紀錄...忘了改xDD)

![](https://static.yiy.tw/media/blog/2020/04/B2-CFWorkers-04-1920x469.png)

5.新增CNAME紀錄後，我們點擊上方的Workers  
接著點擊 Add route

![](https://static.yiy.tw/media/blog/2020/04/B2-CFWorkers-05-1920x693.png)

6.接著這邊我們來設定一下  
Route的部分填寫 剛剛新增的子網域/\*  
ex: img.steveyi.net/\*  
Worker選擇剛剛新增的Worker

![](https://static.yiy.tw/media/blog/2020/04/B2-CFWorkers-06.png)

接著就大功告成啦！

Cloudflare Workers程式碼：
======================

參考資料：

1.  [Using Backblaze B2 and Cloudflare Workers for free image hosting](https://jross.me/free-personal-image-hosting-with-backblaze-b2-and-cloudflare-workers/)
2.  [Bandwidth Alliance | BACKBLAZE](https://www.cloudflare.com/bandwidth-alliance/backblaze/)
3.  [Backblaze and Cloudflare Partner to Provide Free Data Transfer](https://www.backblaze.com/blog/backblaze-and-cloudflare-partner-to-provide-free-data-transfer/)