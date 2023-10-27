---
title: "成為 MANRS 參與者！"
author: "SteveYi"
date: 2021-01-25T00:03:31+08:00
draft: false
tags: ['BGP', 'Network']
---

在去年年底時，我送出了 [SteveYi Network Service](https://network.steveyi.net/) 的 [MANRS](https://www.manrs.org/) 申請  
今年年初時，我們通過了審核。正式成為 MANRS 的參與者！  
我們的會員介紹在這裏 [https://www.manrs.org/isps/participants/entry/1484/](https://www.manrs.org/isps/participants/entry/1484/)  
那麼，我們就順便來說說 我們如何實施 MANRS 政策

MANRS 主要有四個政策，分別是這些

> 避免廣播錯誤的路由  
> 阻止錯誤偽造的IP流量  
> 促進網絡運營商之間的溝通與協調  
> 促進驗證在網際網路內的路由訊息

那我們是如何做到這些呢？

> 首先，我們在我們的核心路由器上阻斷了 [RFC1918](https://tools.ietf.org/html/rfc1918/) 定義的私網 IP 位置流量，來自這些 **IP位置** 的流量並不會往公網發送  
> 其次，我們遵守 [RFC 8212](https://tools.ietf.org/html/rfc8212/)，在沒有明確的路由策略下，我們 **不會廣播沒有使用的網段**。  
> 並且，我們會從我們的 [AS-STEVEYI](https://www.radb.net/query?keywords=AS-STEVEYI) 中產生對應的 IRR 紀錄，並過濾掉 **不屬於我們的路由**

![](https://i.imgur.com/3YMIHgZ.png)

我們也會過濾與我們建立私人對等的對等方路由，我們會將所有對等方的 AS-SET 或 ASN 加進我們的 [AS-STEVEYI-A](https://www.radb.net/query?keywords=AS-STEVEYI-A) 中，並自動產生對應的 IRR 紀錄，過濾無效的路由

我們也歡迎對我們的過濾系統有興趣的網路愛好者/工程師，可以發信至 info_at_steveyi_dot_net 與我們聯繫！
