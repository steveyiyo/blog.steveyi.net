---
title: '刪除 G suite 組織'
author: "SteveYi"
date: 2020-05-15T18:17:25+0000
draft: false
categories: ["科技"]
tags: ["G-Suite", "GCP", "Google", "網域", "網站日誌"]
---

之前有跟大家分享[註冊G Suite帳號](https://blog.steveyi.net/register-gsuite/)的方式，最近想將 [Cloud Identity免費版](https://support.google.com/cloudidentity/answer/7319251?hl=zh-Hant) 的G Suite組織刪除

由於完全沒有刪除過G Suite組織，所以稍微爬文了一下  
大致整理了一下刪除的方式

重要提醒：  
刪除前，請先取消約期授權並刪除所有GCP專案  
刪除後，所有組織資料會被清除

首先，進入[G Suite控制台](https://admin.google.com)，點擊公司資料

![](https://static-a1.steveyi.net/media/blog/2020051515401915.png)

接著點擊帳戶管理

![](https://static-a1.steveyi.net/media/blog/2020051515404022.png)

接著點擊 刪除帳號

![](https://static-a1.steveyi.net/media/blog/2020051515411434.png)

接著會提示你，這個步驟無法復原  
打勾後點擊 刪除帳號

![](https://static-a1.steveyi.net/media/blog/2020051515413046.png)

接著帳號就刪除囉！
