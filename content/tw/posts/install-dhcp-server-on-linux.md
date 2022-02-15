---
title: "在 Linux 上安裝 DHCP 伺服器"
date: 2021-04-11T09:37:30+08:00
draft: false
---

我時常用 Linux 系統當作路由器，理由很簡單，因為虛擬機需要。  
但想了想，既然都這樣做了，何不寫下部落格呢？

那麼... 開始安裝吧！

## 安裝 isc-dhcp-server

首先，我們需要先安裝一個套件，名為 `isc-dhcp-server`

```
sudo apt install isc-dhcp-server
```

![](https://static-a1.steveyi.net/media/blog/install-dhcp-server-in-linux-01.png)

## 設置 DHCP Server

安裝完成後，我們需要編輯設定檔 `/etc/dhcp/dhcpd.conf`  
範例大概像這樣
```
option domain-name "network.steveyi.net"; # 網域名稱
option domain-name-servers 8.8.8.8; # DNS Server

default-lease-time 600; # 預設租賃時間
max-lease-time 3600; # 最大租賃時間
authoritative;

# 網段，這邊分配 /24 使用
subnet 10.121.210.0 netmask 255.255.255.0 {
    range 10.121.210.1 10.121.210.253;
    option subnet-mask 255.255.255.0;
    option routers 10.121.210.254;
}
```

接著，我們需要編輯發 DHCP 包的網卡
`/etc/default/isc-dhcp-server`

![](https://static-a1.steveyi.net/media/blog/install-dhcp-server-in-linux-02.png)

最後，輸入 `service isc-dhcp-server restart`  
這樣就完成囉～