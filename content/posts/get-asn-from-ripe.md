---
title: '從 RIPE 申請屬於自己的 ASN'
date: Sat, 21 Nov 2020 08:39:28 +0000
draft: false
tags: ['ASN', 'BGP', '網際網路', '路由協議']
---

今天來講一下透過 LIR 在 RIPE 取得自己的 ASN

首先，可能有些人會很好奇

**為什麼要選擇 RIPE 呢？選擇 APNIC, ARIN 不好嗎？**

筆者有兩個 ASN，分別是 RIPE 及 APNIC 下的  
當筆者在改一些 whois 時，RIPE 可以直接進入網頁修改  
但 APNIC 則需要發送郵件......比較麻煩(其實好像也差不多)

不過，APNIC 與 RIPE 兩個管理機構也是有差別的  
RIPE 需要驗證真實身份(個人申請需要發送護照或其他證明文件)  
APNIC 則不需要任何證明文件

那麼，我們就開始申請吧

**尋找 LIR（贊助者）**
==============

首先，我們需要找到一位 RIPE 會員 (LIR) 做自己的 Sponsor  
我們只要在 Google 上搜尋「Lir Service」就會看到非常多的相關服務

![](https://static.yiy.tw/media/blog/2020111814292492.png)

那小易嘗試過 [Openfactory](https://freetransit.ch/) 的服務，非常推薦其服務！（雖然比較慢）

**準備申請資料**
==========

我們找到 LIR 之後，透過 Email 或其他管道聯繫後，我們就可以來準備一下申請資料了  
根據小易的經驗，大部分 LIR 都需要這些東西（因為他們需要提交給 RIPE ）

真實英文姓名 (First + Last name)，也就是護照上的名稱  
Postal address（真實地址）  
護照的複印/掃描圖片（有時候可能需要身份證照片）

接著還需要兩個對等方，也就是我們常說的 "Peer Partner"  
如果各位不介意的話，可以直接填寫我的資訊

AS60614(TSUNGYI YU)
peering_at_steveyi.net

AS209557(TSUNGYI YU)
peering_at_steveyi.net

然後由於我們是在 RIPE 申請的，所以我們還需要準備一些對象紀錄  
MAINTAINER, PERSON / ROLE, and ORGANIZATION object  
然後O RG object 中的 "org-name" 必須要是真實姓名（護照名稱）  
關於申請的過程及方式，可以參考一下 [這篇文章](https://blog.steveyi.net/create-object-in-ripe-database/)

那一切都準備好後，LIR 會準備一分用戶協議，簽名完，LIR 就會把你的請求轉交給 RIPE 啦！  
當提交請求給 RIPE 時，大約 1-3 天就會發放 ASN 了

當拿到 ASN 之後，我們就可以來廣播自己的網路啦！  
那我們下一篇會再詳細地與大家分享廣播網路的細節
