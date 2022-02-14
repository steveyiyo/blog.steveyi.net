---
title: '在 Linux 系統上安裝 Wireguard'
date: Sat, 16 May 2020 11:51:52 +0000
draft: false
tags: ['BGP', '伺服器']
---

[Wireguard](https://wireguard.com)是一個點對點加密網路

一直以來，我都使用它來管理我所有的雲端主機

今天就來分享一下安裝方法吧！

安裝指令請參考 [https://www.wireguard.com/install/](https://www.wireguard.com/install/)

首先，進入Wireguard安裝資料夾  
如果找不到的話，請建立一下

```
cd /etc/wireguard
```

![](https://static.yiy.tw/media/blog/2020051611394599.png)

接著，我們使用指令來產生公私鑰，並使用cat查看公私鑰內容

```
wg genkey | tee privatekey | wg pubkey > publickey
```

![](https://static.yiy.tw/media/blog/2020051611445527.png)

接著我們將公私鑰記下來，我們建立一個配置文件

```
nano wg0.conf
```

進入nano 編輯器後，我們將下方代碼貼上，並修改公私鑰

```
[Interface]
Address = 192.168.200.1/24 //這邊可以自定網段
SaveConfig = true
ListenPort = 51820
PrivateKey = 修改為私鑰

[Peer]
PublicKey = 對方的公鑰
AllowedIPs = 192.168.200.2/24 //對方的網段
```

接著輸入 Crtl + X 在輸入y 退出編輯器

接著使用指令，來存檔並啟用wireguard

```
wg-quick save wg0
wg-quick down wg0
wg-quick up wg0
```

PS.開機自動啟動指令

```
systemctl enable wg-quick@wg0
```

接著可以嘗試ping看看，如果有響應的話

代表成功了！

![](https://static.yiy.tw/media/blog/2020051612102187.png)