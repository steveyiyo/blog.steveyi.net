---
title: 'Mailgun + Gmail 達成自訂網域郵箱'
author: "SteveYi"
date: Wed, 22 Apr 2020 12:48:48 +0000
draft: false
tags: ['免費資源', '網域', '網站日誌']
---

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-14.jpg)

小時候總是很好奇寄件者後方的網域名稱是什麼，後來接觸到網站架設後，註冊了許多網域（現在手上大概6個網域左右)，也慢慢解開了小時候的疑惑

今天就來分享一下 Mailgun + Gmail 自訂網域郵箱的方法吧！

首先，先註冊 [Mailgun](https://www.mailgun.com/)，預設有 5000 封信件額度  
PS.如果你是GCP客戶，可以到 [合作頁面](https://www.mailgun.com/google/)，申請免費 30000 額度

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-2-1920x1142.png)

註冊之後，我們進入控制台新增網域（預設會有一個網域）

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-3-1920x1142.png)

上方輸入網域名網域名稱，下方勾選 Create DKIM Authority 並選擇 1024 位元(部分 DNS 服務商不支持 2048 位元)

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-4.png)

接著設定 DNS 紀錄，MX 紀錄一定要設定（不然會收不到信）  
小提醒：如果你有其他郵件收信服務(如: Gsuite, Office… 等)，不要設定 MX 紀錄，不然原先的服務會收不到信

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-5-1920x1142.png)

設置完後，等待 DNS 生效 我們就可以來進行下一個步驟了！

接著我們來設置 SMTP 帳號

首先，打開 Mailgun 控制台  
點擊 Domain settings 選擇 SMTP credentials

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-6-1920x1142.png)

接著點擊右上角的 New SMTP User 來建立新帳號  
右上方為密碼！先記起來，等等會用到

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-7-1920x1142.jpg)

接著我們來設定轉寄郵件

點擊左方的 Receiving，在點擊右上方的 Create Route

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-8-1920x1142.jpg)

接著選擇 Match Recipient (指定收件者)，並輸入剛剛建立的電子郵件地址  
下方 Forward 填寫 Gmail 的電子郵件地址，存檔！  
PS.如果第一項選擇 Cache All，則會轉發所有寄到這個網域下的電子郵件，也就是無限別名

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-9-1920x1142.jpg)

新增完後，我們打開 Gmail 設定→更多設定→帳戶  
點擊 **新增另一個電子郵件地址 (Add another email address)**

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-1-1920x1142.jpg)

接著輸入名稱(自訂)及電子郵件地址(剛剛建立的那個)

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-10.jpg)

接著輸入SMTP伺服器(端口選擇 587tls) 使用者帳號 密碼  
mailgun 的 SMTP 伺服器是 smtp.mailgun.org

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-11.jpg)

接著驗證電子郵件擁有權（代碼會寄到剛剛設置的 Gmail 信箱）

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-12.jpg)

會收到類似這樣的信

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-13-1920x1142.jpg)

將驗證碼輸入上去就完成囉！

後記，好香 有網域信箱就是香（？🤩

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-14.jpg)

工具：[G Suite工具箱](https://toolbox.googleapps.com/)（檢測 DNS 問題）
