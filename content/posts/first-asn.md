---
title: '我的第一個ASN號'
date: Thu, 27 Feb 2020 06:59:19 +0000
draft: false
tags: ['BGP']
---

去年，意外的接觸到了BGP，就下定決心！希望未來可以有自己的IP位置及ASN號碼

今年春節時，恰好發現了一個瑞士的LIR，跟他購買了一個ASN號碼(75法郎)，還多送一個ipv6 /48．(基本上跟LIR購買ASN，都會送一個ipv6 /48。)  
PS.不過不是每個LIR都會送IP位置的，建議大家可以在購買前問問LIR

BGP是什麼？
-------

邊界網關協議（英語：Border Gateway Protocol，縮寫：BGP）是互聯網上一個核心的去中心化自治路由協議。  
它通過維護IP路由表或"前綴"表來實現自治系統（AS）之間的可達性，屬於矢量路由協議  
[維基百科](https://zh.wikipedia.org/zh-tw/%E8%BE%B9%E7%95%8C%E7%BD%91%E5%85%B3%E5%8D%8F%E8%AE%AE)

AS是什麼？
------

**自治系統**或**自治域**（[英文](https://zh.wikipedia.org/wiki/%E8%8B%B1%E6%96%87)：Autonomous system, AS）是指在網際網路中，一個（有時是多個）實體管轄下的所有IP網路和路由器的組合，它們對網際網路執行共同的路由策略。  
[維基百科](https://zh.wikipedia.org/zh-tw/自治系统)

**RIR**是誰？
----------

就是**區域網際網路註冊機構**啦！(像亞洲就是[APNIC](https://www.apnic.net)，台灣則為[TWNIC](https://www.twnic.net))  
[維基百科](https://zh.wikipedia.org/zh-tw/区域互联网注册管理机构)

取得ASN號碼及IP段
===========

想要擁有自己的IP段就必須要先有自治號碼(ASN)，註冊ASN的流程就是...  
付錢給RIR加入會員，跟RIR申請ASN號碼及IP段  
引用一句話：ASN號碼及IP段是免費的，我們只收會員費用  
入會費大約：1400澳幣(聽朋友說的)

所以說，一般人應該不會花錢加入會員(除非你是土豪...xDD)  
必須要找LIR來幫忙申請ASN及IP段了  
PS.LIR就是付錢加入RIR的會員

基本上我們只要在搜尋引擎搜索  
關鍵字 : Lir Service  
就可以找到了  
這邊也分享一下國外論壇整理的LIR名單: [點我前往](https://www.lowendtalk.com/discussion/114478/the-aio-ip-related-thread-ipv4-ipv6-asn-only-providers-are-allowed-to-post-offers) (推薦註冊RIRE的，方便管理)  
PS.每個LIR的價格不同，可以多多比價，我註冊的時候是75法郎

這裡註冊以RIPE為例子 因為我註冊的就是RIPE

RIPE的註冊類型分為兩種:  
個人: 需要護照(或其他證件)、地址、電話號碼、電子郵件等  
公司: 需要公司註冊證書（營業執照）、地址、電話號碼、電子郵件等  
PS.未滿十八歲註冊需要監護人的同意書

接著就等RIP分配號碼，就可以來組建自己的BGP網路了

歡迎大家來跟我建立Peer，前提是我先搞懂Linux路由...xDD