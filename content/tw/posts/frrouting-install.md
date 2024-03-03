---
title: 'FRRouting 安裝教學'
author: "SteveYi"
date: 2020-07-12T13:07:14+00:00
draft: false
categories: ["科技"]
tags: ["BGP", "伺服器"]
---

很久沒有來分享了！最近仍然在學習 BGP 知識及測試之前一直使用 Bird1 來廣播 BGP，後來在跟朋友 Peer 時，一直無法建立對等（很玄，但卻可以跟 IX 建立）

於是我將 BIRD1 解除安裝了，改安裝 [FRRouting](https://frrouting.org/)。

[FRRouting](https://frrouting.org/) 是從 Quagga Fork 來的路由套件，功能也十分強大（ 其指令類似於 Cisco 或 Quagga ）

使用者指南（英文）：[https://docs.frrouting.org/en/latest/](https://docs.frrouting.org/en/latest/)  
GitHub 專案：[https://github.com/FRRouting/frr/releases](https://github.com/FRRouting/frr/releases)

首先，我們要先來安裝 [FRRouting](https://frrouting.org/)

### 更新套件

```
sudo apt update -y
sudo apt upgrade -y

# 安裝網路套件及 GPG 套件
sudo apt install -y curl gnupg2 traceroute
```

### 安裝 FRRouting

```
# 導入 GPG
curl -s https://deb.frrouting.org/frr/keys.asc | sudo apt-key add -
FRRVER="frr-stable"

# 寫入軟體源
echo deb https://deb.frrouting.org/frr $(lsb_release -s -c) $FRRVER | sudo tee -a /etc/apt/sources.list.d/frr.list

# 安裝 FRRouting
sudo apt update -y && sudo apt install -y frr frr-pythontools
```

### 開啟 IP forwarding

```
echo "
net.ipv4.conf.all.forwarding = 1
net.ipv6.conf.all.disable_ipv6 = 0
net.ipv6.conf.default.disable_ipv6 = 0
net.ipv6.conf.lo.disable_ipv6 = 0
net.ipv6.conf.default.forwarding = 1
net.ipv6.conf.all.forwarding = 1
net.ipv6.conf.all.proxy_ndp = 1
net.ipv6.conf.all.accept_ra = 2
" | sudo tee -a /etc/sysctl.conf

sudo sysctl -p
```

### 啟動 FRRouting 所有功能

```
sudo sed -i "s/=no/=yes/g" /etc/frr/daemons
sudo service frr restart
```

### 進入 FRRouting 互動 Cli

```
sudo vtysh
```

進入互動式 CLI ，不出意外的話，就可以進行配置了  
鍵入 config 就可以進入設定界面囉！
