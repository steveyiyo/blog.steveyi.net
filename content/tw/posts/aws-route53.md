---
title: '[教學] AWS Route 53 代管DNS'
author: "SteveYi"
date: 2020-04-06T14:38:57+00:00
draft: false
categories: ["科技"]
tags: ["AWS", "網域", "網站日誌"]
---

從2017年 [註冊了第一個網域之後](https://diary.steveyi.net)，DNS 代管商一直是我在研究的一個部分！  
今天來推薦一下由 [AWS](https://aws.amazon.com) 推出的 DNS 代管服務 - [Route 53](https://aws.amazon.com/tw/route53/)

前置作業：  
[AWS帳號](https://blog.steveyi.net/signup-aws-account/)  
網域

# 建立託管區域

首先，進入 AWS 主控台搜尋 Route 53

![](https://static-a1.steveyi.net/media/blog/2020050917090249-scaled.jpg)

接著點擊左上角的託管區域

![](https://static-a1.steveyi.net/media/blog/2020050917092329-scaled.jpg)

點擊左上角的，建立託管區域 接著在右方自己的網域名稱

![](https://static-a1.steveyi.net/media/blog/2020050917094366-scaled.jpg)

接著系統就會建立一個託管區域囉！（這邊先將NS紀錄記起來，下個步驟會用到）

![](https://static-a1.steveyi.net/media/blog/2020050917104942.png)

# 設定 DNS 伺服器

那我們剛剛已經在 AWS Route 53 建立了 DNS 託管區域，接著我們要到網域註冊商來設定 DNS 伺服器！

首先，打開網域管理頁面（本篇以 Gandi 示範），並找到名稱伺服器或是 Nameservers

![](https://static-a1.steveyi.net/media/blog/2020050917101357-scaled.jpg)

點擊變更後，將原本的紀錄刪除，並將 AWS Route 53 自動產生的 NS 紀錄貼上去

![](https://static-a1.steveyi.net/media/blog/2020050917103474.png)

接著就等待生效囉！大約 24-48 小時生效（實際上應該 5-10 分鐘生效 XD）
