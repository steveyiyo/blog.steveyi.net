---
title: '在 Vultr 使用 Bird6 廣播 IPv6'
author: "SteveYi"
categories: ["科技"]
date: 2020-04-10T02:21:55+00:00
draft: false
tags: ["BGP", "伺服器"]
---

![](https://static-a1.steveyi.net/media/blog/2020/04/vu-00.png)

**建議可以參考於 2021 年 01 月 24 日 的 [透過 BGP 與朋友組成內網](https://blog.steveyi.net/posts/make-internal-network-by-bgp/) 文章**

這次就來分享一下在 [Vultr](https://vultr.com) 廣播IP吧！

**設置 AS 號碼及 IP 前綴**
===============

首先，我們要先開通 BGP 的功能！
[點擊這裡前往 Vultr BGP 頁面](https://my.vultr.com/network/#network-bgp)
進入此頁面後，我們點擊 Get Started

![](https://static-a1.steveyi.net/media/blog/2020/04/vu-01-1920x961.png)

選擇 I have my own IP space 及 I have own my ASN (如果沒有 ASN 不用選擇)

而關於 LOA 的部分，可以參考 [這份](https://www.vultr.com/docs/example-letter-of-authorization-for-bgp-announcements/) 範例文件

接著其他保持預設就好

![](https://static-a1.steveyi.net/media/blog/2020/04/vu-02.png)

接著點 Start，來驗證 IP 擁有權 或 ASN

![](https://static-a1.steveyi.net/media/blog/2020/04/vu-03-1920x362.png)

系統會寄一封電子郵件到 Whois 的 Email，進行驗證！

![](https://static-a1.steveyi.net/media/blog/2020/04/vu-04.png)

驗證完後呢，我們就等待工作人員設置

**廣播**
======

這次是使用 Ubuntu 18.04 來進行宣告的，CentOS 及 Debian 應該大同小異

首先我們先安裝幾個套件

```
apt-get update -y
apt-get install bird6 -y
```

安裝完成後，我們進入 /etc/bird 資料夾

```
cd /etc/bird
```

刪除 bird6.conf

```
sudo rm -rf bird6.conf
```

接著我們新增一個新的設定檔

```
router id 0.0.0.0; # 將0.0.0.0改成你的主機IPv4

protocol bgp vultr
{
   local as 209557;
   source address 改成主機IPv6;
   import none;
   export all;
   graceful restart on;
   multihop 2;
   neighbor 2001:19f0:ffff::1 as 64515; # Vultr的IP及私有AS號
   password "123456789"; # 之前設定的BGP密碼
}
protocol static
{
    route 要宣告的 prefix via 閘道 IP;
}
protocol device 
{
    scan time 5;
}
```

設置好後，我們重啟bird6

```
service bird6 restart
```

接著我們就可以嘗試追蹤路由看看囉！
