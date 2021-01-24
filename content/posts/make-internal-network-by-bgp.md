---
title: '透過 BGP 與朋友組成內網'
date: Sun, 24 Jan 2021 02:00:00 +0000
draft: true
tags: ['BGP', 'Network']
---

嗨！好久不見！

在 2020 初時，我拿到了第一個 ASN號碼 - [AS209557](https://bgp.he.net/AS209557/)

我也使用了 [RFC 1918](https://tools.ietf.org/html/rfc1918) 所定義的 IP Address ，與我一些朋友透過 BGP 及 Internet 隧道 組成了一個大內網

那麼，讓我們開始吧！

首先，我們使用 Ubuntu 20.04 來建立隧道，並與其他人建立 BGP 對等

那通常，我都是使用 GRE, SIT 或是 WireGuard

其中，GRE 或 SIT 隧道是屬於非加密隧道，在公網上是可以查看到其封包的。若要加密需要配上 IPsec

WireGuard 則是在 2019 年 9 月 推出的點對點隧道，在 2020 年 3 月 已列入 Linux 內核

（其實更早就在 Beta 了，但小易用 WireGuard 時已經是屬於穩定版了）

那接著，是我與我朋友的對等信息

PS. 部分 IP Address 被基於安全因素，可能與實際使用的 IP Address 不同

我的資料

```
公網 IP Address: 59.126.1.1
隧道內 IP Address: 10.0.0.1/30
```

對方資料

```
公網 IP Address: 140.113.1.1
隧道內 IP Address: 10.0.0.2/30
```

建立完隧道之後，我們嘗試 ICMP PING 看看

```
root@tw-stuin:~# ping 10.0.0.2
PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.
64 bytes from 10.0.0.2: icmp_seq=1 ttl=64 time=3.26 ms
64 bytes from 10.0.0.2: icmp_seq=2 ttl=64 time=3.22 ms
64 bytes from 10.0.0.2: icmp_seq=3 ttl=64 time=3.24 ms
--- 10.0.0.2 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 3.223/3.242/3.259/0.014 ms
```

好，看起來通了！

那接著，透過 BGP 協議來組建大內網了！


首先，我們必須要在 Linux 上安裝一個 BGP Routing Daemon

在 Linux 系統上，大部分人都使用 (BIRD)[https://bird.network.cz/] 或是 (FRRouting)[https://frrouting.org/]

BIRD 比較類似於寫程式的概念(? FRRouting 則是類似於 Cisco 的概念(?

至少我是這樣認為的，但本篇是使用 FRRouting 來進行操作

首先，我們可以先參考 (這篇文章)[https://blog.steveyi.net/posts/frrouting-install/] 來安裝 FRRouting