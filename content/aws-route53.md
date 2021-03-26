---
title: '[教學] AWS Route 53 代管DNS'
date: Mon, 06 Apr 2020 14:38:57 +0000
draft: false
tags: ['AWS', '網域', '網站日誌']
---

從2017年[註冊了第一個網域之後](https://diary.steveyi.net)，DNS代管商一直是我在研究的一個部分！  
今天來推薦一下由[AWS](https://aws.amazon.com)推出的DNS代管服務 - [Route 53](https://aws.amazon.com/tw/route53/)

前置作業：  
[AWS帳號](https://blog.steveyi.net/signup-aws-account/)  
網域

**建立託管區域**
----------

首先，進入AWS主控台搜尋 Route 53

![](https://static.yiy.tw/media/blog/2020050917090249-scaled.jpg)

接著點擊左上角的託管區域

![](https://static.yiy.tw/media/blog/2020050917092329-scaled.jpg)

點擊左上角的，建立託管區域 接著在右方自己的網域名稱

![](https://static.yiy.tw/media/blog/2020050917094366-scaled.jpg)

接著系統就會建立一個託管區域囉！（這邊先將NS紀錄記起來，下個步驟會用到）

![](https://static.yiy.tw/media/blog/2020050917104942.png)

**設定DNS伺服器**
------------

那我們剛剛已經在AWS Route 53建立了DNS託管區域，接著我們要到網域註冊商來設定DNS伺服器！

首先，打開網域管理頁面（本篇以Gandi示範），並找到名稱伺服器或是Nameservers

![](https://static.yiy.tw/media/blog/2020050917101357-scaled.jpg)

點擊變更後，將原本的紀錄刪除，並將AWS Route 53自動產生的NS紀錄貼上去

![](https://static.yiy.tw/media/blog/2020050917103474.png)

接著就等待生效囉！大約24-48小時生效（實際上應該5-10分鐘生效xD）