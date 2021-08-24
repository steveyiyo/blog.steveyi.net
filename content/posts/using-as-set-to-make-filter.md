---
title: '利用 AS-SET 建立過濾器'
date: 2021-06-27T05:35:35+08:00
draft: false
tags: ['網際網路', 'BGP']
---

最近，為了跟一些新入坑的朋友們建立 BGP Peer，所以也順便來教他們怎麼使用 AS-SET 過濾。

### 什麼是 AS-SET

AS-SET 是一個可以新增 ASN 及 AS-SET 的 Object。  
通常用於過濾透過 BGP 協議所交換的路由。（如 BGP Peer Neighbor、Internet Exchange Route Server 等）

我們通常透過 Whois 及遞迴的方式，來查詢這個 AS-SET 中的所有 Route Object。

舉例來說，我們今天要透過 AS-STEVEYI 對某一個 BGP Peer 進行過濾。  
首先，先透過 whois 查詢這個 AS-SET 中有哪些 ASN，然後我們在繼續查詢這個 AS-SET 中的其他 AS-SET（這邊的為 AS-STEVEYI-C ）

```command
$ steveyiyo@steveyi-MBP ~ % whois -r AS-STEVEYI
as-set:         AS-STEVEYI
descr:          SteveYi Network Service
members:        AS17413
members:        AS60614
members:        AS141173
members:        AS209557
remarks:        --- DownStream ---
members:        AS-STEVEYI-C
remarks:        ----------
tech-c:         YT1698-RIPE
admin-c:        YT1698-RIPE
mnt-by:         STEVEYI-MNT
created:        2020-09-10T18:57:46Z
last-modified:  2021-03-26T15:31:21Z
source:         RIPE
```

接著，我們可以透過 [RADB](https://www.radb.net/) 查詢對應的 Route Object 紀錄

![](https://static.yiy.tw/media/blog/1624742087.png)

我們就可以根據這個規則來建立過濾器了！

### 建立過濾器

首先，我先推薦一個建立 filter 的工具 - [bgpq3](https://github.com/snar/bgpq3)  
他可以針對 ASN 或 AS-SET 產生過濾器，而且支援很多種路由套件或路由系統！

```
# 可以直接透過 apt 進行安裝
$ sudo apt install bgpq3
```

```
# 產生 IPv4 prefix-list
$ bgpq3 -4l AS-STEVEYI_v4 AS-STEVEYI -R 24 -m 24

# 產生 IPv6 prefix-list
$ bgpq3 -6l AS-STEVEYI_v6 AS-STEVEYI -R 48 -m 48
```

![](https://static.yiy.tw/media/blog/1624742917.png)

接著，我們可以建立一個 `route-map` 來針對某個 BGP Peer 過濾

```conf
# vtysh
config
    route-map AS-STEVEYI_v4 permit 5
        match ip address prefix-list AS-STEVEYI_v4
        set community 60614:100
```

這樣就完成啦！