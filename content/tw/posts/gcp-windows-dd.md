---
title: '專為 GCP 打造的 Windows 10 DD 鏡像'
author: "SteveYi"
date: 2019-08-27T15:07:49+00:00
draft: false
categories: ["科技"]
tags: ["VPS", "伺服器"]
---

前陣子為了要在 GCP 使用 VPS，於是在一段時間裡製作了 Windows DD 鏡像  
分別是：  
1，中文繁體版 Windows 10 工作站專業版  
2，英文版 Windows 10 工作站專業版(尚未上傳)

鏡像具備以下特點
--------

*   集成 Virtio 驅動以及 Google Virtio Ethernet Adapter 的網卡驅動，因此適用於[GCP](http://cloud.google.com)的 VPS 伺服器  
    
*   無需 VNC 交互直接無人值守安裝，DD 完成即可遠程登錄桌面  
    
*   基於 VOL 版製作，因此可用 KMS 方式激活系統  
    
*   開啟 Windows 遠程桌面
    
    中文繁體版  
    載點1: [http://static-a1.steveyi.net/mirror/dd/win10.gz](http://static-a1.steveyi.net/mirror/dd/win10.gz)  
    
    遠端登入資訊  
    帳號: Administrator  
    密碼: steveyigame.com
