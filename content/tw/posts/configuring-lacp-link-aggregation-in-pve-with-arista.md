---
title: "PVE 搭配 Arista 設定 LACP 鏈路聚合"
date: 2023-02-07T02:39:05+08:00
draft: false
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