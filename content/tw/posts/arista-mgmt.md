---
title: "在 Arista 上設定 OOB 網路"
author: "SteveYi"
categories: ["科技"]
tags: ["網路交換機"]
date: 2022-07-05T02:58:47+08:00
draft: false
description: "最近部署了一台 Arista 交換器。由於這台交換機上做了 L3 Routing，所以沒辦法直接將 OOB 網路設定預設路..."
---

最近部署了一台 Arista 交換器。由於這台交換機上做了 L3 Routing，所以沒辦法直接將 OOB 網路設定預設路由。

為了解決這個問題，我們建立了一個 VRF 來隔離 OOB 網路。

## 如何設定

首先，我們先定義一個新的 VRF 及 rd

```
vrf definition OOB
   rd 10:1
```

接著我們設定 MGMT 網卡

```
interface Management1
   vrf forwarding OOB
   ip address 10.39.0.2/24
```

設定靜態路由，並啟用 VRF 的 Routing 功能

```
ip route vrf OOB 0.0.0.0/0 10.39.0.1
ip routing vrf OOB
```

接著可以輸入 `show ip route vrf OOB` 來查看設定的路由

```
arista#show ip route vrf OOB

VRF name: OOB
Codes: C - connected, S - static, K - kernel, 
       O - OSPF, IA - OSPF inter area, E1 - OSPF external type 1,
       E2 - OSPF external type 2, N1 - OSPF NSSA external type 1,
       N2 - OSPF NSSA external type2, B I - iBGP, B E - eBGP,
       R - RIP, I L1 - ISIS level 1, I L2 - ISIS level 2,
       O3 - OSPFv3, A B - BGP Aggregate, A O - OSPF Summary,
       NG - Nexthop Group Static Route, V - VXLAN Control Service

Gateway of last resort:
 S      0.0.0.0/0 [1/0] via 10.39.0.1, Management1

 C      10.39.0.0/24 is directly connected, Management1
```

## 測試

使用 `ping vrf OOB ip 1.1.1.1` 來測試是否可以連通

```
arista#ping vrf OOB ip 1.1.1.1 
PING 1.1.1.1 (1.1.1.1) 72(100) bytes of data.
80 bytes from 1.1.1.1: icmp_seq=1 ttl=59 time=0.623 ms
80 bytes from 1.1.1.1: icmp_seq=2 ttl=59 time=0.417 ms
80 bytes from 1.1.1.1: icmp_seq=3 ttl=59 time=0.419 ms
80 bytes from 1.1.1.1: icmp_seq=4 ttl=59 time=0.460 ms
80 bytes from 1.1.1.1: icmp_seq=5 ttl=59 time=0.460 ms

--- 1.1.1.1 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4ms
rtt min/avg/max/mdev = 0.417/0.475/0.623/0.080 ms, ipg/ewma 1.004/0.548 ms
```
