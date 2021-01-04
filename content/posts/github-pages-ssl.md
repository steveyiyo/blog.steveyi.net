---
title: 'Github Pages 綁定自訂網域及SSL'
date: Thu, 23 Apr 2020 05:19:40 +0000
draft: false
tags: ['免費資源', '網域', '網站日誌']
---

上篇跟大家分享了 [透過Github託管靜態網站](https://blog.steveyi.net/github-static-website/)，這篇文章就來分享一下綁定自訂網域及開啟SSL的過程吧！

首先，進入Github Repository的設定  
輸入自訂的網域，接著點擊Save  
右側會有一個 xxxxx.github.io. 的子網域，先記起來 等等會用到

![](https://static.yiy.tw/media/blog/2020/04/github-pages-ssl-1-1920x1142.jpg)

接著我們進入DNS服務商來設定DNS紀錄（這邊是用AWS Route 53）

設定CNAME紀錄  
值為上方的 xxxxx.github.io.

![](https://static.yiy.tw/media/blog/2020/04/github-pages-ssl-2.png)

大約等待2-3分鐘，就會生效囉！

接著回到Github Pages設定，等待DNS生效（大約15分鐘）  
勾選Enforce HTTPS，系統就會自動部署SSL憑證

![](https://static.yiy.tw/media/blog/2020/04/github-pages-ssl-3.png)

這樣就完成部署囉！

Demo: [https://git-demo.yiy.tw](https://git-demo.yiy.tw)