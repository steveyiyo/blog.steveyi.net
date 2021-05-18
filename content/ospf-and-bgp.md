---
title: "利用 OSPF 及 BGP 來最佳化大內網"
date: 2021-05-16T22:17:25+08:00
draft: true
---

一直一來，我跟朋友間有一個大內網（類似於 DN42）  
我們使用 VPN 建立 BGP 互聯，並將這個大內網部署於我各個區域的設備使用  
P.S. 目前共有 46 條路由左右

![](https://static.yiy.tw/media/blog/1621242200.png)

而我目前則是在一個點與其他人建立 **BGP Peer**，並使用 **Static Route** 處理內部路由

Ex: 10.121.23.242 的設備想要到我的內網下的某台設備 10.121.210.3

![](https://static.yiy.tw/media/blog/1621238898.png)

比如說，我在核心路由器上指一條 10.121.210.0/24 到我放在學校的路由器上  
而在學校的路由器上，我則與核心路由器建立了 BGP Peer，來收我們的大內網全表

![](https://static.yiy.tw/media/blog/1621244817.png)

這樣確實可以讓我們的網路動，但是！  
當我們核心路由器故障時，其他人則無法進到我的內網

於是我想到，我可以使用 OSPF 及 iBGP 去解決單一核心路由器故障的問題

## 什麼是 OSPF？

OSPF 全名 Open Shortest Path First，是一種 IGP 協議，使用 Link State Routing 算法。

IETF 中的 IGP 開發團隊在 1988 年提出 [RFC 2328](https://datatracker.ietf.org/doc/html/rfc2328)，用於 IPv4 的路由協定。

在當時，由於 RIP 單一路徑最多只能支援 15 個網路設備，所以 RIP 路由協定在當時並不適合用於大型的網路環境，所以才會研發 IGRP 路由協定，並且同時開發出 OSPF 協定。 

目前 OSPF 分為兩種版本

- [OSPF v2](https://datatracker.ietf.org/doc/html/rfc2328) (IPv4)
- [OSPF v3](https://datatracker.ietf.org/doc/html/rfc5340) (IPv6)