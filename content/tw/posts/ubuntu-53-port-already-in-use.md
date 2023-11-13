---
title: "解決 Ubuntu 上 53 Port 占用問題"
author: "SteveYi"
categories: ["科技"]
tags: ["網路"]
date: 2021-05-12T20:58:02+08:00
draft: false
---

最近為了在路由器上安裝 DoH Client 並架設 DNS Server 給內網機器使用，發現 Ubuntu 常常會使用 53 Port。

經過檢查一輪後，發現是 systemd-resolve 所導致的，於是找到這些方法去關閉他！

在此之前，如果大家發現 53 Port 被使用，可以先下以下指令來查看是哪個進程去用的。

```
sudo netstat -pna | grep 53
```

那接著，我們來關閉一下 systemd-resolve 使用 53 Port 的問題吧

首先，我們編輯 /etc/systemd/resolved.conf 文件

```
sudo vi /etc/systemd/resolved.conf
```

我們將 DNSStubListener 取消註解，並修改為 No

```
[Resolve]
#DNS=
#FallbackDNS=
#Domains=
#LLMNR=no
#MulticastDNS=no
#DNSSEC=no
#DNSOverTLS=no
#Cache=yes
DNSStubListener=no
#ReadEtcHosts=yes
```

接著，在輸入這行指令

```
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
```

最後，我們先將 systemd-resolved 服務重啟

```
sudo systemctl restart systemd-resolved
```

接著，我們就可以使用 53 Port 囉！
