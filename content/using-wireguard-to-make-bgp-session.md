---
title: "唉啊，我的網路不通誒 - Debug 網路日常！"
date: 2021-04-09T10:04:13+08:00
draft: true
---

一直以來，我都是使用 WireGuard 來建立 BGP Session。  
在不久之前，[@edisonlee55](https://edisonlee55.com/) 也使用 WireGuard 建立 BGP Session，並遇到了一些問題...

## 為什麼網路不通

通常網路不通有很多原因，但常見的原因是...

```
網路線斷掉
DHCP Server 沒有運作
DNS Server 設定錯誤
電腦設定了 Proxy
路由不可達（少見）
```

通常大部分都是遇到這些問題啦，但 [@edisonlee55](https://edisonlee55.com/) 遇到的卻是最少見的，路由不可達！

# 什麼是路由不可達

為什麼會說很少見呢？

在一般的路由器或電腦，設定好 PPPoe 或靜態 IP 後  
都會順帶將 Gateway 設定好，這就間接設定了預設路由。

~~但畢竟我們是一群網路愛好者，所以不稀奇(X~~

