---
title: '從RIPE申請屬於自己的ASN'
date: Sat, 21 Nov 2020 08:39:28 +0000
draft: false
tags: ['ASN', 'BGP', '網際網路', '路由協議']
---

今天來講一下透過LIR在RIPE取得自己的ASN

首先，可能有些人會很好奇

_**為什麼要選擇RIPE呢？選擇APNIC, ARIN不好嗎？**_

筆者有兩個ASN，分別是RIPE及APNIC下的  
當筆者在改一些whois時，RIPE可以直接進入網頁修改  
但APNIC則需要發送郵件......比較麻煩(其實好像也差不多)

不過，APNIC與RIPE兩個管理機構也是有差別的  
RIPE需要驗證真實身份(個人申請需要發送護照或其他證明文件)  
APNIC則不需要任何證明文件

那麼，我們就開始申請吧

**尋找LIR（贊助者）**
==============

首先，我們需要找到一位RIPE會員(LIR)做自己的sponsor  
我們只要在Google上搜尋「lir service」就會看到非常多的相關服務

![](https://static.yiy.tw/media/blog/2020111814292492.png)

那小易嘗試過 Securebit 及 [Openfactory](https://freetransit.ch/) 的服務，主要差別就是...

Securebit 快(1-5天) 貴 提供的PA 沒有MNT權限  
[Openfactory](https://freetransit.ch/) 慢(1-20天) 便宜 提供的PA 有MNT權限

所以，個人比較推薦[Openfactory](https://freetransit.ch/)啦！（除非你想要申請16-bit ASN）

**準備申請資料**
==========

我們找到LIR之後，透過Email或其他管道聯繫後，我們就可以來準備一下申請資料了  
根據小易的經驗，大部分LIR都需要這些東西（因為他們需要提交給RIPE）

真實英文姓名(First + Last name)，也就是護照上的名稱  
Postal address（真實地址）  
護照的複印/掃描圖片（有時候可能需要身份證照片）

接著還需要兩個對等方，也就是我們常說的"Peer Partner"  
如果各位不介意的話，可以直接填寫我的資訊

AS60614(TSUNGYI YU)
peering_at_steveyi.net

AS209557(TSUNGYI YU)
peering_at_steveyi.net

然後由於我們是在RIPE申請的，所以我們還需要準備一些對象紀錄  
MAINTAINER, PERSON / ROLE, and ORGANIZATION object  
然後ORG object中的"org-name"必須要是真實姓名（護照名稱）  
關於申請的過程及方式，可以參考一下 [這篇文章](https://blog.steveyi.net/posts/create-object-in-ripe-database/)

那一切都準備好後，LIR會準備一分用戶協議，簽名完，LIR就會把你的請求轉交給RIPE啦！  
當提交請求給RIPE時，大約1-3天就會發放ASN了

當拿到ASN之後，我們就可以來廣播自己的網路啦！  
那我們下一篇會再詳細地與大家分享廣播網路的細節
