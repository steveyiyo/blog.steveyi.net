---
title: 'FRRouting 入坑指南兼心得(1)'
date: Sun, 12 Jul 2020 13:07:14 +0000
draft: false
tags: ['BGP', '伺服器']
---

很久沒有來分享了！最近仍然在學習BGP知識及測試之前一直使用bird1來廣播BGP，後來在跟朋友Peer時，一直無法建立對等（很玄，但卻可以跟IX建立

最近則卸載了Bird1，改安裝[ffrouting](https://frrouting.org/)是從Quagga fork來的，慢慢發展成現在  
同時，他也是一個很強大的路由套件（其指令類似於Cisco或Quagga）

於是，就摸索了一下  
整理了一些心得使用者指南(英文): [http://docs.frrouting.org/en/latest/](http://docs.frrouting.org/en/latest/)  
GitHub專案: [https://github.com/FRRouting/frr/releases](https://github.com/FRRouting/frr/releases)

首先，我們要先來安裝ffrouting

### 更新套件
```
apt update -y
apt upgrade -y
apt install -y curl gnupg2 traceroute
```
### 安裝FRRouting
```
curl -s [https://deb.frrouting.org/frr/keys.asc](https://deb.frrouting.org/frr/keys.asc) | sudo apt-key add -
FRRVER="frr-stable"
echo deb [https://deb.frrouting.org/frr](https://deb.frrouting.org/frr) $(lsb\_release -s -c) $FRRVER | sudo tee -a /etc/apt/sources.list.d/frr.list
sudo apt update -y && sudo apt install -y frr frr-pythontools
```
### 開啟IP forwarding
```
echo "
net.ipv4.conf.all.forwarding = 1
net.ipv6.conf.all.disable\_ipv6 = 0
net.ipv6.conf.default.disable\_ipv6 = 0
net.ipv6.conf.lo.disable\_ipv6 = 0
net.ipv6.conf.default.forwarding = 1
net.ipv6.conf.all.forwarding = 1
net.ipv6.conf.all.proxy\_ndp = 1
net.ipv6.conf.all.accept\_ra = 2
" | tee -a /etc/sysctl.conf

sysctl -p
```
### 啟動frrouting所有功能
```
sed -i "s/=no/=yes/g" /etc/frr/daemons
service frr restart
```
### 進入frrouting互動cli
```
sudo vtysh
```

進入互動cli，不出意外的話  
應該會看到下面這樣

接著就可以進行配置了  
鍵入 config 進入設置界面關於進階設置，下篇再來分享吧！