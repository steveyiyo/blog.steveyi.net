---
title: '利用WireGuard建立大內網'
date: Fri, 20 Nov 2020 18:31:04 +0000
draft: false
tags: ['VPS', '伺服器']
---

Hi 大家好，今天來分享一下如何使用WireGuard建立大內網  
  
之前有與大家分享過 [在Linux系統上安裝Wireguard](https://blog.steveyi.net/posts/how-to-install-wireguard/)，那這次我們要利用WireGuard來建立大內網

為什麼筆者稱這次要建立"大內網"呢？  
因為筆者也許多不同地方的網路，想藉由這次機會，來把他們都加進同一個局域網

這樣也可以解決一些連線問題，比如筆者常常連線回到家中的電腦  
但因為公網IP只有幾個，當機器太多時，就需要設定內網穿透

但筆者架設了內網之後，在外面只需要連入VPN，在其他網路區域，就可以存取所有網路設備了（這也類似於一般企業的遠端存取）

那麼，我們一樣需要有一個主伺服器當網關。不過，我們不使用NAT TO NAT，而是透過私網IP來進行互連

我們的情境是這樣：

A辦公室 路由器 10.121.208.254/24  
B辦公室 路由器 10.121.209.254/24  
C辦公室 路由器 10.121.210.254/24  
VPN路由器 10.121.211.254/24

首先，由於我們這次是純粹架設大內網，以WireGuard搭配靜態路由為主。所以先不講到路由協議（不過下次會介紹）

我們需要有一個主路由器，並透過它來連接A,B,C辦公室的路由器

所以會變成下面這樣  
VPN <-> A  
VPN <-> B  
VPN <-> C

當A的用戶想去C時(10.121.208.1 <-> 10.121.210.2) 路線會變成...  

User-A -> 10.121.208.254 -> 10.121.211.254 -> 10.121.210.254 -> 10.121.210.2(User-C)

也就是 User-A -> A的路由器 -> VPN Gateway -> C的路由器 -> User-C

那我們搞懂原理，就來實作啦！

首先，我先先準備好私鑰及公鑰（公鑰是由私鑰算過來的）

A's Public key: WGokwN2HtiX+naa7hdvUaXoXk5tkzXQtMge4v9DKlVw=  
B's Public key: fVNXw6EpC65DmIsY/XsWXL6EXLU9oFW7CL5cZr82Di8=  
C's Public key: ORbEFZlR/IWFWaD42Nh00DfYEpCX2CbNmRy/Hc+crVQ=  
VPN's Public Key: Rxcti9/3jLII4JOscHn9/yp5Z8ZROcYk8tugXn/FRHM=

那我們就在配置中這樣寫...

```
[Interface]
PrivateKey = <各處的private key>
Address = <各個路由器的IP，比如說A路由器 10.121.208.254/24>

[Peer]
PublicKey = <VPN Gateway Public Key>
Endpoint = <VPN Gateway's EndPoint>
AllowedIPs = 10.121.209.0/24,10.121.210.0/24,10.121.211.0/24
PersistentKeepalive = 10
```

我們在個節點這樣配，上方例子是A路由器的  
B路由器則是這樣

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

  
相Ｎ信C路由器大家應該就會配了

最後，大家只需要在每台路由器上執行指令 `wg-quick up <wireguard_網卡名稱>` 就可以互通啦！

特別注意：這種網路架構，如果VPN Gateway掉線了，那A,B,C也就不能彼此互通了