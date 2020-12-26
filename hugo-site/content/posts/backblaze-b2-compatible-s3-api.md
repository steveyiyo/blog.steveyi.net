---
title: 'Backblaze B2 支援S3 API了！'
date: Thu, 14 May 2020 03:08:02 +0000
draft: false
tags: ['伺服器', '對象存處', '網域']
---

前幾天打開Backblaze後，看到一行大大的字

![](https://static.yiy.tw/media/blog/2020051402585860.png)

沒錯！S3 API跟Backblaze B2兼容啦！

S3 API是目前市面上最流行的協定，很多軟硬體都兼容

Backblaze B2則是非常棒的雲端存處(低價優勢)

如何使用S3 API
----------

若存處桶是在2020/05/04前創立的，則要創立一個新的，並將檔案移入(推薦使用[Rclone](https://rclone.org)，會自動支援[B2 Copy File](https://www.backblaze.com/b2/docs/b2_copy_file.html))

然後創建一個新的App Key(不要使用主要的喔)

有關於一些B2的文章介紹:  
[Backblaze B2 低價的雲端數據存儲服務  
](https://blog.steveyi.net/backblaze-b2/)[Backblaze B2和Cloudflare Workers設定自訂域名  
](https://blog.steveyi.net/b2-cfworkers/)[BackBlaze宣布第一個歐洲數據中心啟用](https://blog.steveyi.net/backblaze-eu-central/)