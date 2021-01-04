---
title: 'RIPE為IP設定反向DNS(PTR紀錄)'
date: Wed, 08 Apr 2020 06:38:54 +0000
draft: false
tags: ['BGP', '伺服器', '網域']
---

![](https://static.yiy.tw/media/blog/2020/04/set-rdns-he.png)

反向dns紀錄

一直以來都很想設定rDNS，看了許多次RIPE官方的文檔還是沒搞懂  
恰好這次有位大佬指導我去設定，其實一點都不難呢  
順便分享一下設定過程

本篇以[RIPE](https://ripe.net)及[HE FREE DNS](http://dns.he.net)作為範例，其他RIR基本上大同小異

**建立DNS NameServers**
=====================

首先，登入[HE FREE DNS](http://dns.he.net/)，點擊左方的Add a new reverse

![](https://static.yiy.tw/media/blog/2020/04/he-01.png)

輸入你的IP前綴，後方記得加上cidr(子網路掩碼)

![](https://static.yiy.tw/media/blog/2020/04/he-02.png)

接著我們先設定一個PTR紀錄  
關於IP的轉換為網域名稱，可以使用這個工具 [點我前往](https://www.securebit.ch/tools/network/arpa)

![](https://static.yiy.tw/media/blog/2020/04/he-03.jpg)

由於HE跟RIPE會互相檢查DNS授權，所以我們必須要先請HE開通DNS區域  
我們可以發送郵件到 dnsadmin#he.net \[#換成@\]

Subject: About PTR records (改成你的IPv6前綴網域)

Content:  
Hello, I want set PTR records with my ipv6 address(改成你的IPv6前綴)  
RIPE require DNS delegation check  
Please check it :)  
Thanks!

![](https://static.yiy.tw/media/blog/2020/04/he-04-1920x908.png)

當HE開通後，我們就可以到RIPE設定了！

**設定DNS伺服器**
============

首先，我們進入[LIR Portal](https://lirportal.ripe.net/)

![](https://static.yiy.tw/media/blog/2020/04/he-05-1920x864.png)

點擊左邊的Create an Object，選擇domain

![](https://static.yiy.tw/media/blog/2020/04/he-07-1920x864.png)

接著輸入要設定的ipv6 前綴

![](https://static.yiy.tw/media/blog/2020/04/he-06-1920x797.png)

接著依序輸入HE的DNS Server 及 Admin-c tech-c zone-c...等等  
ns1.he.net ns2.he.net ns3.he.ne ns4.he.net ns5.he.net

![](https://static.yiy.tw/media/blog/2020/04/he-08-1920x1013.png)

完成後按Submit就會開始建立了

![](https://static.yiy.tw/media/blog/2020/04/he-09.png)

當出現這個畫面時，代表建立完成囉！

![](https://static.yiy.tw/media/blog/2020/04/he-10.png)

接著後續步驟就跟一般網域的DNS設定相同囉！

需要特別注意的是 反向DNS是要設定PTR紀錄，正向則要設定A或AAAA紀錄  
名稱的話則可以使用這個工具 [點我前往](https://www.securebit.ch/tools/network/arpa) 來轉換/查看

PS.如果需要查看DNS是否生效，可以使用[Google Public DNS](https://dns.google)查詢