---
title: '透過 BGP 組建不同網段互通'
date: Tue, 11 Aug 2020 18:56:26 +0000
draft: true
tags: ['BGP']
---

小時候常常為了家中的網路管理而困擾，舉例來說，我家有三個樓層 三個路由器  
我想讓三個路由器後的設備可以互通，但是如果我三台路由器都打開 DHCP Server 的話，三台將會是獨立的網段而不互通

後來發現如果使用 bridge (橋接)的方式將一台路由器當作 DHCP Server，其他的當作 AP 或 Switch，就可以達到網段相同且可以互通了！

不過，這次我們要做的是"異地組網"，很難去做到使用同一個的DHCP Server來連接，所以就會有兩個網段

那之前有跟大家分享過 [FRRouting 入坑指南兼心得 (1)](https://blog.steveyi.net/frrouting-install/)，我們也可以透過BGP及隧道來組建不同區域網段互通

讓我們開始吧！

首先，我們需要先準備一些東西

路由器須為 Linux 系統(如果是 ROS 或 Cisco IOS 也可以)  
路由套件(推薦使用 Frrouting, bird)

本篇將以 [Frrouting](https://frrouting.org/) 作為示範

首先，雙方路由器必須支持 BGP，否則只能使用 NAT 設備來進行互通了

我們先在雙方路由器配置好路由器 IP  
以下為範例  
Router-A 的 IPv4 為 10.0.1.1/24 DHCP 分配 10.0.1.2 - 10.0.1.254  
Router-B 的 IPv4 為 10.0.2.1/24 DHCP 分配 10.0.2.2 - 10.0.2.254

那我們在路由器 A 向 B 廣播 network 10.0.1.0/24  
相對應的，路由器 B 向 A 廣播 network 10.0.2.0/24

接著確認雙方 BGP Session 通了之後，我們檢查系統路由表 `ip route`  
應該就會看到下方這樣  
`10.0.1.0/24 via 對方的隧道 IP dev tun0 proto bgp metric 20 `

接著就可以嘗試使用 mtr 或 ping 看對方路由器後的網段設備是否有連通囉！

給大家參考一下 FRRouting 的設定檔

路由器 A

```
Current configuration:
!
frr version 7.3.1
frr defaults traditional
hostname gateway-tw
log syslog informational
service integrated-vtysh-config
!
router bgp 209557
 neighbor 10.121.1.22 remote-as 209557
 neighbor 10.121.1.22 description JP-Gateway
 !
 address-family ipv4 unicast
  network 10.0.1.0/24
 exit-address-family
!
line vty
!
end
```

路由器B

```
Current configuration:
!
frr version 7.3.1
frr defaults traditional
hostname gateway-tw
log syslog informational
service integrated-vtysh-config
!
router bgp 209557
 neighbor 10.121.1.21 remote-as 209557
 neighbor 10.121.1.21 description TW-Gateway
 !
 address-family ipv4 unicast
  network 10.0.2.0/24
 exit-address-family
!
line vty
!
end
```

完成後，效果會類似這樣唷！

![](https://static-a1.steveyi.net/media/blog/2020081118552052.png)

PS. 其實更簡單的方式是直接在A, B路由器上寫上路由表  
`ip route add 10.0.1.0/24 via peer_tunnel_ip dev tunnel_interfaces`