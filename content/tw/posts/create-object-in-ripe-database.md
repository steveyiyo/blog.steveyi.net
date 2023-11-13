---
title: '在 RIPE DataBase 建立 Object'
author: "SteveYi"
date: 2020-11-21T08:37:20+00:00
draft: false
categories: ["科技"]
tags: ["ASN", "BGP", "網際網路", "路由協議"]
---

在本篇文章中，將與大家分享如何在 RIPE DataBase 註冊 MAINTAINER, PERSON / ROLE, and ORGANIZATION object

這些對象也是註冊 ASN 必要的，如果要申請 ASN，可以參考 [這篇教學](https://blog.steveyi.net/get-asn-from-ripe/)

那首先，我們要先註冊 RIPE 的帳號 [註冊網站在這](https://access.ripe.net/registration)

![](https://static-a1.steveyi.net/media/blog/2020112108155764.png)

註冊完成之後，我們進入 RIPE Datebase，然後點擊 "Create an Object"（建立一個物件Object）

![](https://static-a1.steveyi.net/media/blog/2020112108175021.png)

然後我們選擇第一個 "role and maintainer pair"

![](https://static-a1.steveyi.net/media/blog/2020112108190258.png)

第一個填寫 mnter，他將會是 "mnt-by"  
role 隨意輸入  
address 寫自己家裡地址  
email 寫自己的電子郵箱地址

![](https://static-a1.steveyi.net/media/blog/2020112108210139.png)

註冊完成後，你會拿到一個 role 與 mnter，這邊要記住 primary key  
我們等等會用到

![](https://static-a1.steveyi.net/media/blog/2020112108240373.png)

建立好後，我們需要在回去 role，新增一個 "abuse-mailbox" 濫用投訴信箱，等等ORG object需要使用

![](https://static-a1.steveyi.net/media/blog/2020112108270350.png)

完成後，我們回到 "Create an Object"（建立一個物件Object）的步驟  
這次選擇建立 Organisation

![](https://static-a1.steveyi.net/media/blog/2020112108273384.png)

完成後，我們點擊Submit  
我們需要更改的內容有  
"org-name": 填寫自己的真實英文姓名(護照上的)  
"address": 地址  
"e-mail": 電子郵件地址  
"abuse-c": 剛剛我們建立的role  
"mnt-ref": 剛剛我們建立的mnter

![](https://static-a1.steveyi.net/media/blog/2020112108330053.png)

完成後，我們點擊 Submit  
就完成啦

![](https://static-a1.steveyi.net/media/blog/2020112108331094.png)

最後，我們只需要將 ORG 的編號給 LIR，就可以啦！

如果還是不懂的話，可以參考RIPE的影片！https://www.ripe.net/support/training/videos/ripe-database
