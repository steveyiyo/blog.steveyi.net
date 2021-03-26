---
title: 'Cloudflare 新服務 spectrum設定教學'
date: Wed, 15 Apr 2020 08:50:06 +0000
draft: false
tags: ['Cloudflare', '伺服器']
---

今天早上打開[FaceBook](https://facebook.com/)時，發現[Cloudflare](https://cloudflare.com/)推出了一個新服務 - [Spectrum](https://cfl.re/3efcOhv)  
目前是提供給所有付費用戶使用，不知道未來有沒有機會開放給免費客戶  
官方部落格連結: [https://cfl.re/3efcOhv](https://cfl.re/3efcOhv)

正好我有幾個網域有使用Plesk Plus的服務（此服務已下架），算是Cloudflare Pro版本 所以也可以開通這個功能！

那就來記錄一下設定過程吧

首先，進入網域設定 上方選擇 Spectrum  
接著點擊 Enable [Spectrum](https://cfl.re/3efcOhv)

![](https://static.yiy.tw/media/blog/2020050916443011-1920x1142.png)

開通完成後，點擊 Create an application

![](https://static.yiy.tw/media/blog/2020050916445886-1920x1142.png)

選擇SSH(22端口)或是Minecraft(65535端口) (如果是企業版可以使用RDP)

![](https://static.yiy.tw/media/blog/2020050916452556-1920x1142.png)

接著輸入子網域及IP位置，並按Save

![](https://static.yiy.tw/media/blog/2020050916455234-1920x1142.png)

接著我們就可以等待生效囉！

可以使用終端(dig 網域名稱)或是[Google Public DNS](https://dns.google/)查詢CNAME紀錄

![](https://static.yiy.tw/media/blog/2020050916461922-1920x1142.png)

目前這個服務  
Pro版本提供5GB流量/月  
Business版本提供10GB流量/月  
超過1GB，以0.1USD計價  
[https://www.cloudflare.com/products/cloudflare-spectrum/](https://www.cloudflare.com/products/cloudflare-spectrum/)

![](https://static.yiy.tw/media/blog/2020050916464540-1920x1142.png)

對於DDOS防禦很頭痛的可以試試看～！