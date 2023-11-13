---
title: "利用 FRRouting 設定策略路由"
author: "SteveYi"
categories: ["科技"]
tags: ["網路"]
date: 2021-05-18T16:23:58+08:00
draft: false
---

前幾天，我為了調整我實驗室內的網路架構，讓其可以全部走 VPN 出去，並且可以進入到我的大內網，所以在研究策略路由 (PBR)

我本來是使用 VRF（三層交換）來隔離我的網路（其實這樣應該算另類的策略路由了吧X），但這樣會導致我沒辦法把我的 Service 監聽在 VRF Interface 內。

導致... 我就不能架設 DoH 在路由器上了

後來，我發現我可以利用其他方式做到 PBR，而不需要透過 VRF 來隔離

## PBR 是什麼？

PBR 全名 Policy Based Routing，是一種可以透過修改下一跳 IP Address 來達到控制路由或封包方向的一種技術

## 在 Linux 下怎麼做到？

Linux 下其實有許多種方式可以做到，比如說透過 Routing Daemon 或是 ``ip link`` 及 ``ip rule`` 的指令去做到

```
# 比如說我想要讓 10.121.210.0/24 這條路由放在一張表裡面
ip rule add from 10.121.210.0/24 lookup TW

# 並讓其網路走 VPN Interface 出去
ip route add 0.0.0.0/0 via 10.121.210.0/24 dev VPN-JP table TW
```

但這樣的話，我每次都開機時都要執行一次 Script。

但我又不想要透過 Script 去設定 PBR

![](https://static-a1.steveyi.net/media/blog/1621326935.png)

於是我查詢了一下 [FRRouting](https://frrouting.org/) 這套路由套件有沒有相關功能，沒想到真的有設計 PBR 的功能！

仔細看完 [官方文件](https://docs.frrouting.org/en/latest/pbr.html) 後，我們就馬上來實作啦！

在此之前，若還沒有安裝 FRRouting 的話，可以參考 [這篇文章](https://blog.steveyi.net/frrouting-install/) 來進行安裝唷～

## 設定 PBR

那目前，我們的需求是這樣

```
# VPN 隧道
IP Address: 10.121.99.0/31
Gateway: 10.121.99.1/31

# 大內網
Route: 10.120.0.0/14
Gateway: 10.121.208.254

# 用於伺服器內的機器及實體電腦
10.121.210.0/24

# 需求
Default Route 發往 VPN 對端，並設定 SNAT
```

所以我們可以輸入這些指令，來新增規則

- interface <interface_name>
    - PBR Policy

- nexthop-group <自定義名稱>
    - nexthop <下一跳，理論上是 VPN 對端>

- pbr-map <自定義名稱> seq <優先程度>
    - match <來源 IP 或是目的地 IP>
    - set nexthop-group <上面定義的名稱>
    - `# 如果 match 的話，則就綁定上我們剛剛建立的規則`

```
interface ens19
 pbr-policy VPN
!
interface tun1
 pbr-policy VPN
!
nexthop-group JP
 nexthop 103.156.184.1
!
nexthop-group STUIN
 nexthop 10.121.208.254
!
pbr-map VPN seq 5
 match dst-ip 10.120.0.0/14
 set nexthop-group STUIN
!
pbr-map VPN seq 10
 match src-ip 10.121.210.0/24
 set nexthop-group JP
!
```
最終，我們可以輸入指令 `show pbr nexthop-groups`，來查看目前的規則！

![](https://static-a1.steveyi.net/media/blog/1621331786.png)
