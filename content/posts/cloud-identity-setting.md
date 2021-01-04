---
title: 'Cloud Identity 驗證網域及建立帳號'
date: Fri, 15 May 2020 20:35:49 +0000
draft: false
tags: ['G-Suite', 'GCP', 'Google', '網域', '網站日誌']
---

在上一篇文，我們成功[建立了Cloud Identity免費版](https://blog.steveyi.net/create-cloud-identity/)

在這篇文章，我們將要進行驗證網域的步驟

首先，登入[G Suite管理面板](https://admin.google.com)

![](https://static.yiy.tw/media/blog/2020051520092614.png)

點擊驗證網域所有權

![](https://static.yiy.tw/media/blog/2020051520093813.png)

接著可以選擇DNS或HTML驗證（這邊推薦使用HTML驗證）

![](https://static.yiy.tw/media/blog/2020051520095743.png)

我使用DNS驗證了2-3次，都錯誤QQ（可能是Google系統的Bug）

![](https://static.yiy.tw/media/blog/2020051520101982.png)

若驗證超過兩分鐘，代表...你得重新驗證了xD

![](https://static.yiy.tw/media/blog/2020051520100925.png)

驗證完成後，我們就可以建立使用者囉！

![](https://static.yiy.tw/media/blog/2020051520102838.png)

由於目前我還不需要建立使用者（Cloud Identity免費版可以建立50個使用者）  
之後有需要的話，在到[G Suite管理面板](https://admin.google.com)建立即可

![](https://static.yiy.tw/media/blog/2020051520103669.png)

接著我們可以進入[Google Cloud Platform](https://console.cloud.google.com/)

![](https://static.yiy.tw/media/blog/2020051520104690.png)

由於剛創建帳號，我們需要同意一下服務條款

![](https://static.yiy.tw/media/blog/2020051520105965.png)

完成！

PS.剛進入GCP沒看到機構，可能是因為剛創建好帳號 系統還在建立中  
等待5-10分鐘應該就可以了！

![](https://static.yiy.tw/media/blog/2020051520111522.png)