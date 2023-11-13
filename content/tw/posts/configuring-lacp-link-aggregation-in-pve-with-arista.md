---
title: "PVE 搭配 Arista 設定 LACP 鏈路聚合"
author: "SteveYi"
date: 2023-02-07T02:39:05+08:00
draft: false
categories: ["科技"]
tags: ["網路", "虛擬化"]
---

最近遇到一台機器使用兩張 NVIDIA Mellanox ConnectX-4 網卡，最高速率支援 25G。  
但由於我們光模是 10G 的，且 Arista 7050QX 也不能支援 25G Only，所以就想說來設定一下 LACP。

## 環境

- Arista 7050QX-32S
- Proxmox VE
    - ovs-vsctl (Open vSwitch) 2.15.0

## Arista 上設定 LACP

此處分成兩個步驟：

- 建立 Port Channel
- 在物理網卡上指令 Port Channel

***
特別注意：在 `switchport` 的部分維持原樣就好，記得 Port Channel 及 Ethernet Interface 兩端都要設定。
***

### 在 Arista 上建立一個 Port Channel

```shell
interface Port-Channel1001
   description PVE-N1-LACP
   switchport mode trunk
```

### 在 Ethernet Interface 上設定 Channel Group。 

這邊最好開成主動 (Active) 而不是被動 (Passive)，防止 LACP neighbor 建立失敗。

```shell
interface Ethernet7/1
   description PVE-N1-P0(R)
   switchport mode trunk
   channel-group 1001 mode active
!
interface Ethernet8/1
   description PVE-N1-P1(L)
   switchport mode trunk
   channel-group 1001 mode active
```

## PVE 上設定 LACP

PVE 上有兩種方法，分別是：

- Linux Bond
- OVS Bond

> 在本文中是使用 OVS Bond 做示範。

### 安裝 Open vSwitch

進入 PVE Shell，輸入以下指令進行安裝。

```shell
sudo apt install openvswitch-switch -y
```

### 設定介面卡

*注意 Linux Bridge 及 OVS 不可混用！*

1. 先建立一個 OVS Bridge

![](https://i.imgur.com/PRJDx2A.png)

2. 建立 OVS Bond

Mode 選擇 LACP (balance-tcp)，在 Slaves 內填入要做物理網卡的名稱並綁定剛剛建立的 OVS Bridge。  
如果網卡不是 Trunk Mode 的話，可以這邊寫入 VLAN ID，或是在建立 VM 時指定。

![](https://i.imgur.com/7fvU2gd.png)

> 如果想瞭解更多關於 OVS Bonding 的內容，可以參考 [Hwchiu](https://www.hwchiu.com/) 的 [Understanding the OpenvSwitch Bonding](https://www.hwchiu.com/openvswitch-bonding.html)。

3. 建立 OVS IntPort（可選）

如果你需要透過這個 LACP 的網卡訪問 PVE 面板的話，需要在這邊設定 VLAN 或是 Native VLAN 網卡。

![](https://i.imgur.com/yqPhGCm.png)

全部完成後，按下 Apply Configuration。  
這時系統會使用指令 `ifreload --all` 來重啟整個 PVE Host 的網路，並建立 LACP 連線。

若一切正常的話，LACP 就可以正常使用囉～

## 結果

這邊主要有兩種：
1. LACP 狀態
2. 測速結果

### 查看 LACP 狀態

Arista

```shell
core#show interfaces Port-Channel 1001
Port-Channel1001 is up, line protocol is up (connected)
  Hardware is Port-Channel, address is 7483.ef49.cfda
  Description: PVE-N1-LACP
  Ethernet MTU 9214 bytes, BW 20000000 kbit
  Full-duplex, 20Gb/s
  Active members in this channel: 2
  ... Ethernet7/1 , Full-duplex, 10Gb/s
  ... Ethernet8/1 , Full-duplex, 10Gb/s
  Fallback mode is: off
  Up 2 days, 10 hours, 21 minutes, 6 seconds
  4 link status changes since last clear
  Last clearing of "show interface" counters never
  5 minutes input rate 324 kbps (0.0% with framing overhead), 200 packets/sec
  5 minutes output rate 582 kbps (0.0% with framing overhead), 496 packets/sec
     913814733 packets input, 1101680299997 bytes
     Received 52458 broadcasts, 61239 multicast
     0 input errors, 0 input discards
     1430249790 packets output, 1734991390380 bytes
     Sent 13679583 broadcasts, 5532412 multicast
     0 output errors, 1235 output discards
```

PVE

```shell
root@node2:~# ovs-appctl bond/list
bond    type    recircID        members
bond0   balance-tcp     1       ens20f1np1, ens20f0np0
root@node2:~# ovs-appctl bond/show bond0
---- bond0 ----
bond_mode: balance-tcp
bond may use recirculation: yes, Recirc-ID : 1
bond-hash-basis: 0
lb_output action: disabled, bond-id: -1
updelay: 0 ms
downdelay: 0 ms
next rebalance: 7952 ms
lacp_status: negotiated
lacp_fallback_ab: false
active-backup primary: <none>
active member mac: b8:59:9f:ab:ff:89(ens20f1np1)

member ens20f0np0: enabled
  may_enable: true
  hash 1: 1 kB load
  hash 2: 1 kB load
  hash 8: 5 kB load
  hash 15: 3 kB load
  hash 42: 1 kB load
  hash 45: 1 kB load
  hash 46: 1 kB load
  hash 49: 1 kB load
  hash 56: 1 kB load
  hash 63: 2 kB load
  hash 65: 1 kB load
  hash 70: 1 kB load
  hash 72: 1 kB load
  hash 84: 2 kB load
  hash 90: 4 kB load
  hash 99: 3 kB load
  hash 102: 32 kB load
  hash 105: 36 kB load
  hash 108: 33 kB load
  hash 111: 30 kB load
  hash 118: 13 kB load
  hash 122: 1 kB load
  hash 127: 8 kB load
  hash 135: 1 kB load
  hash 142: 2 kB load
  hash 151: 1 kB load
  hash 155: 30 kB load
  hash 169: 1 kB load
  hash 172: 5 kB load
  hash 176: 2 kB load
  hash 178: 3 kB load
  hash 184: 3 kB load
  hash 195: 3 kB load
  hash 204: 5 kB load
  hash 205: 1 kB load
  hash 207: 1 kB load
  hash 208: 6 kB load
  hash 210: 3 kB load
  hash 215: 1 kB load
  hash 235: 1 kB load
  hash 244: 30 kB load
  hash 247: 1 kB load
  hash 254: 3 kB load

member ens20f1np1: enabled
  active member
  may_enable: true
  hash 3: 2 kB load
  hash 13: 1 kB load
  hash 21: 10 kB load
  hash 27: 1 kB load
  hash 32: 3 kB load
  hash 34: 2 kB load
  hash 40: 20 kB load
  hash 60: 40 kB load
  hash 96: 1 kB load
  hash 115: 1 kB load
  hash 131: 142 kB load
  hash 152: 3 kB load
  hash 157: 1 kB load
  hash 159: 1 kB load
  hash 164: 1 kB load
  hash 188: 28 kB load
  hash 196: 1 kB load
  hash 211: 1 kB load
  hash 224: 1 kB load
  hash 225: 3 kB load
  hash 227: 2 kB load
  hash 229: 52 kB load
  hash 241: 3 kB load
  hash 250: 3 kB load
```

### 測速結果

我們在不同 node 中，準備了兩台 VM 並搭配 `iperf3` 來做跨節點互聯測速。  
可以看到在不使用 Multi-Thread 的情況下，速度可以輕鬆超過 10Gbp！

![](https://i.imgur.com/l7XnFka.jpg)
