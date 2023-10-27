---
title: "在 Linux 上實現虛擬 WAN 多撥 PPPoE"
author: "SteveYi"
categories: "科技"
tags: 網路
date: 2021-07-19T08:47:55+08:00
draft: flase
description: "I've been using Linux as a router for quite some time."
---

前幾天，剛好想起來家中網路的 ISP（中華電信），可以透過撥號取得 7 個浮動的 Public IPv4 Address，於是就來實現他了！

## 環境

> 以下資訊是透過 [bench.sh](https://bench.sh) 的 Script 所產生的

```shell
----------------------------------------------------------------------
 CPU Model             : Intel(R) Celeron(R) CPU 3865U @ 1.80GHz
 CPU Cores             : 2
 CPU Frequency         : 1278.526 MHz
 CPU Cache             : 2048 KB
 Total Disk            : 14.9 GB (6.6 GB Used)
 Total Mem             : 1910 MB (256 MB Used)
 Total Swap            : 2047 MB (0 MB Used)
 System uptime         : 3 days, 18 hour 30 min
 Load average          : 0.07, 0.06, 0.01
 OS                    : Ubuntu 20.04.1 LTS
 Arch                  : x86_64 (64 Bit)
 Kernel                : 5.4.0-77-generic
 TCP CC                : cubic
 Virtualization        : Dedicated
 Organization          : AS3462 Data Communication Business Group
 Location              : Chang-hua / TW
 Region                : Taiwan
----------------------------------------------------------------------
```

## 建立虛擬網卡

首先，我們需要先建立幾個虛擬 WAN，其 MacAddress 會不同。  
這些是我們等等使用 PPPoe 連線需要使用到的。

* enp1s0 為接上中華電信路由器的網卡，name 後可以自定義

> 這邊先建立 7 個虛擬網卡

```
ip link add link enp1s0 name wan0 type macvlan
ip link add link enp1s0 name wan1 type macvlan
ip link add link enp1s0 name wan2 type macvlan
ip link add link enp1s0 name wan3 type macvlan
ip link add link enp1s0 name wan4 type macvlan
ip link add link enp1s0 name wan5 type macvlan
ip link add link enp1s0 name wan6 type macvlan
```

## 設定 PPPoe 連線

> 我在 Linux 中使用 pppoeconf。  
> 如果沒有裝的話，可以透過以下指令安裝一下。

```
sudo apt install pppoeconf
```

我們先進入 pppoeconf，將帳號密碼輸入進去。

接著，再進去 `/etc/ppp/peers` 資料夾，將 dsl-provider 文件複製為其他檔案。  
並修改複製後檔案中的網卡名稱（ex: nic-wan1 -> nic-wan0）

![](https://i.imgur.com/06M8VBv.png)

接著，使用指令 `pon <檔案名稱>` 來啟用 PPPoe 連線。  
再下 `ip addr` 就可以看到網卡列表。

![](https://i.imgur.com/yg6Tx59.png)

這樣就大功告成囉！
