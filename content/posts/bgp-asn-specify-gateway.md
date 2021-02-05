---
title: "透過 ASN 指定網路出口"
date: 2021-02-06T02:13:10+08:00
draft: false
image: "https://i.imgur.com/mgyCzFl.png"
---

在去年一月時，我申請到了自己的第一個 ASN - [AS209557](https://whois.steveyi.net/whois/AS209557)，也做了很多酷實驗！

今天，我改造了我家的路由，並可以指定 ASN 走哪條路出去

### 首先，先說一下我家的路由器資訊

Ubuntu 20.04 軟路由  
Bird2 (Internet Routing Daemon)  
![](https://i.imgur.com/iKW3r01.png)

### 網路環境(包括 VPN 隧道)

中華電信 PPPoe 非固定制 IP 100/40M  
到 TANet 的 [WireGuard](https://wireguard.com/) Tunnel  
到 GCP 的 [WireGuard](https://wireguard.com/) Tunnel  
到 Vultr 的 [WireGuard](https://wireguard.com/) Tunnel  

那主要做法是要將 AS1659 及 AS6939 的網走 TANet  
AS60614 走 Vultr    
其餘的走中華電信  
並全部開啟 NAT  
整個家中內網處於一個 VRF (vrf_HOME) 中  
PS.但下方文章會直接收入 Kernel  

### 安裝 bird2

首先，我們要先安裝 bird2，這是一個路由進程軟體。  
可以處理 BGP, OSPF, ISIS, Static Route... 等等的路由

Debian & Ubuntu:
```
apt install bird2
```

CentOS:
```
yum install bird2
```

### BGP Configure

那安裝好之後呢，我們需要透過 eBGP Multihop 收一張全表  
理論上現有的網路供應商都會要求你必須要有 IANA 承認的 ASN 才可以進行對等

不過，我們也是可以使用 Private ASN 來對等（如果對面允許的話）  
這邊推薦使用 Vultr 的 VPS 來收全表，詳情可以參考 [在 Vultr 使用 Bird 廣播 IPv6](https://blog.steveyi.net/posts/use-bird6-broadcast-ipv6-vultr/) 這篇文章。

那我們由於是 Multihop，對面所發的路由我們都到不了  
所以我們將路由放到 table 裡面

```
ipv4 table global_v4;
```

接著，由於我們是要將寫入 VRF 中。我們先建立一個 filter policy  
如果 ASN 等於 60614，那麼就將路由改成 10.121.1.2。其他不變... 以此類推

```
filter policy_routing {

        # TANet
        if bgp_path.last = 1659 then {
            gw = 10.121.208.254;
            accept;
        }

        # HE
        if bgp_path.last = 6939 then {
            gw = 10.121.208.254;
            accept;
        }
 
        # SteveYi Network Service
        if bgp_path.last = 60614 then {
            gw = 10.121.218.62;
            accept;
        }

        reject;
}
```

### 最終

由於我又調整網路了，所以目前只設定收兩條路由（

![](https://i.imgur.com/mgyCzFl.png)

Code 差不多就長這樣，大家也可以試試看  
感覺我好像也可以來做個自動設置 eBGP multihop 的酷東西呢(#
```
log syslog all;
router id 10.121.211.254;
# debug protocols all;
watchdog warning 5 s;
watchdog timeout 30 s;
ipv4 table global_v4;
ipv4 table policy_v4;
protocol device {}
protocol direct { ipv4; }
 
template bgp bgp_feeder {
    multihop;
    graceful restart on;
    ipv4 {
        table global_v4;
        import all;
        export none;
    };
}
 
protocol bgp SteveYi_Feed from bgp_feeder {
	local as 209557;
    neighbor as 60614;
    neighbor xxx.xxx.xxx.xxx;
}

define steveyi_asn = [
        60614,
        209557
];

filter policy_routing {
    # SteveYi Network Service
    if bgp_path.last ~ steveyi_asn then {
        gw = 10.121.217.11;
        accept;
    }

    # HE
    if bgp_path.last = 6939 then {
        gw = 10.121.218.62;
        accept;
    }

    reject;
}

# 防止 Feed 被 BGP 吃掉
protocol static
{
    ipv4;
	route 10.120.0.0/14 via 10.121.208.254;
}

protocol kernel
{
    scan time 20;
    ipv4 {
        table global_v4;
        import none;
        export filter policy_routing;
    };
}
```

### 參考文章 & 協助夥伴

感謝 [James](https://swineson.me/) 的 [在家也要玩BGP（1.5）：我的双线分流规则](https://blog.swineson.me/zh/bgp-at-home-1-5-my-filter-rules/)  
感謝 [奈特](https://who.nat.moe/) 提供 bird2 上的使用協助及技巧