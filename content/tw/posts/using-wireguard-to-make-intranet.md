---
title: '利用 WireGuard 建立大內網'
author: "SteveYi"
date: Fri, 20 Nov 2020 18:31:04 +0000
draft: false
tags: ['VPS', '伺服器']
---

Hi 大家好，今天來分享一下如何使用 WireGuard 建立大內網  
  
之前有與大家分享過 [在 Linux 系統上安裝 Wireguard](https://blog.steveyi.net/how-to-install-wireguard/)，那這次我們要利用 WireGuard 來建立大內網

## 為什麼要建立大內網？

為什麼筆者稱這次要建立「大內網」呢？  
因為筆者也許多不同地方的網路，想藉由這次機會，來把他們都加進同一個局域網 (LAN)

這樣也可以解決一些連線問題，比如筆者常常連線回到家中的電腦  
但因為公網 IP 只有幾個，當機器太多時，就需要設定內網穿透

但筆者架設了內網之後，在外面只需要連入VPN，在其他網路區域，就可以存取所有網路設備了（這也類似於一般企業的遠端存取）

## 情境及架構

那麼，我們一樣需要有一個主伺服器當網關。不過，我們不使用 NAT TO NAT，而是讓 Private 可以直接互連。

我們的情境是這樣：

- A 辦公室 路由器 10.121.208.254/24  
- B 辦公室 路由器 10.121.209.254/24  
- C 辦公室 路由器 10.121.210.254/24  
- VPN 路由器 10.121.211.254/24

## 設定 VPN Tunnel 及靜態路由

首先，由於我們這次是純粹架設大內網，以 WireGuard 搭配靜態路由為主。
所以先不講到路由協議。如果你有興趣的話，也可以參考我寫的 [透過 BGP 組建不同網段互通](https://blog.steveyi.net/posts/bgp-network-peer/)。

我們需要有一個主路由器，並透過它來連接 A, B, C 辦公室的路由器

所以會變成下面這樣  
```
VPN <-> A  
VPN <-> B  
VPN <-> C
```
當A的用戶想去 C 時 (10.121.208.1 <-> 10.121.210.2) 路線會變成...  

User-A -> 10.121.208.254 -> 10.121.211.254 -> 10.121.210.254 -> 10.121.210.2 (User-C)

也就是 User-A -> A 的路由器 -> VPN Gateway -> C 的路由器 -> User-C

那我們搞懂原理，就來實作啦！

首先，我先先準備好私鑰及公鑰（公鑰是由私鑰算過來的）

```
A's Public key: WGokwN2HtiX+naa7hdvUaXoXk5tkzXQtMge4v9DKlVw=  
B's Public key: fVNXw6EpC65DmIsY/XsWXL6EXLU9oFW7CL5cZr82Di8=  
C's Public key: ORbEFZlR/IWFWaD42Nh00DfYEpCX2CbNmRy/Hc+crVQ=  
VPN's Public Key: Rxcti9/3jLII4JOscHn9/yp5Z8ZROcYk8tugXn/FRHM=
```

那我們就在配置中這樣寫...

```
[Interface]
PrivateKey = <各處的 Private Key>
Address = <各個路由器的 IP，比如說 A 路由器 10.121.208.254/24>

[Peer]
PublicKey = <VPN Gateway Public Key>
Endpoint = <VPN Gateway's EndPoint>
AllowedIPs = 10.121.209.0/24,10.121.210.0/24,10.121.211.0/24
PersistentKeepalive = 10
```

我們在各節點這樣配，上方例子是 A 路由器的  
B 路由器則是這樣

```
[Interface]
PrivateKey = <各處的private key>
Address = <各個路由器的IP，比如說B路由器 10.121.209.254/24>

[Peer]
PublicKey = <VPN Gateway Public Key>
Endpoint = <VPN Gateway's EndPoint>
AllowedIPs = 10.121.208.0/24,10.121.210.0/24,10.121.211.0/24
PersistentKeepalive = 10
```

  
相信 C 路由器大家應該就會配了。

最後，大家只需要在每台路由器上執行指令 `wg-quick up <wireguard_網卡名稱>` 就可以互通啦！

特別注意：這種網路架構，如果 VPN Gateway 故障的話，那 A, B, C 也就不能彼此互通了。
