---
title: 'Backblaze B2 支援 S3 API 了！'
author: "SteveYi"
date: 2020-05-14T03:08:02+0000
draft: false
categories: ["科技"]
tags: ["伺服器", "對象存處", "網域"]
---

前幾天打開 Backblaze 後，看到一行大大的字

![](https://static-a1.steveyi.net/media/blog/2020051402585860.png)

沒錯！S3 API 跟 Backblaze B2 兼容啦！

S3 API 是目前市面上最流行的協定，很多軟硬體都兼容

Backblaze B2 則是非常棒的雲端存處(低價優勢)

如何使用 S3 API
----------

若存處桶是在 2020/05/04 前創立的，則要創立一個新的，並將檔案移入(推薦使用 [Rclone](https://rclone.org)，會自動支援 [B2 Copy File](https://www.backblaze.com/b2/docs/b2_copy_file.html))

然後創建一個新的 App Key (不要使用主要的喔)

有關於一些 B2 的文章介紹:

[Backblaze B2 低價的雲端數據存儲服務](https://blog.steveyi.net/backblaze-b2/)  
[Backblaze B2 和 Cloudflare Workers 設定自訂域名](https://blog.steveyi.net/b2-cfworkers/)  
[BackBlaze 宣布第一個歐洲數據中心啟用](https://blog.steveyi.net/backblaze-eu-central/)
