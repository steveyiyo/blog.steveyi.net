---
title: '在 Ubuntu 系統下架設 Tunnel Broker 服務 (v4 to v6)'
author: "SteveYi"
categories: ["科技"]
date: 2020-05-31T16:56:41+00:00
draft: false
tags: ["VPS", "伺服器", "網域"]
---

### 前言

之前拿到了一個自治號碼(AS Number)，也拿到了1個 /44 及兩個 /48 的iPv6  
恰好最近想到之前有使用過HE.Net的tunnel broker服務  
這次就來架設一下sit隧道的tunnel broker服務！本篇不會說明ipv6的取得方式，請自行詢問主機提供商

本篇將使用開源工具-[IPv6-in-IPv4 Tunnel](https://github.com/sskaje/6in4.git)

### 配置工具

首先，將工具下載下來

```
git clone [https://github.com/sskaje/6in4.git](https://github.com/sskaje/6in4)
```

![](https://static-a1.steveyi.net/media/blog/2020053018041378.jpg)

我們進入項目的etc資料夾，並修改config.ini

```
nano config.ini
```

![](https://static-a1.steveyi.net/media/blog/2020053018044764.jpg)

依序編輯 IPV6\_NETWORK, IPV6\_CIDR, INTERFACE, BIND\_IP(有多iPv4需要)

![](https://static-a1.steveyi.net/media/blog/2020053018050652.jpg)

接著輸入 Crtl + X 來保存

### 修改系統設定來允許iPv6轉發

```
nano /etc/sysctl.conf  
  
在最下方添加下方這項net.ipv6.conf.all.forwarding = 1  
  
Crtl + X 保存  
sysctl -p
```

### 防火牆

```
iptables -I INPUT -p 41 --j ACCEPT  
iptables -I OUTPUT -p 41 --j ACCEPT  
iptables -I FORWARD -p 41 --j ACCEPT
```

### 使用工具建立伺服端(新增隧道)

假設隧道ID為1，伺服端IPv4為1.1.1.1 用戶端IPv4為8.8.8.8]

配置文件中設置的IPv6子網為 2a0e:b107:7e0::，子網路遮罩為48(必須為8的倍數)工具會自動分割出 一個用於隧道的 /64子網及一個用於用戶路由的 /64子網  

如果用戶端需要給其下級設備分配的話，建議伺服端的子網 應大於 /64，這樣才能產生 /64的下級子網，以保證SLAAC的運作。

![](https://static-a1.steveyi.net/media/blog/2020053018052119.jpg)

接著我們就可以至用戶端配置了！(配置過程可以參考[https://tunnelbroker.net/](https://tunnelbroker.net/))

### 報錯：sipcalc required

我在第一次新增隧道時，遇到了這個問題  
解決方式如下

```
CentOS:  
yum install sipcalc  
Ubuntu/Debian:  
apt-get install sipcalc
```

### 測試結果

[https://test-ipv6.com/](https://test-ipv6.com/) 測試結果

![](https://static-a1.steveyi.net/media/blog/2020053018053577.png)

路由追蹤

![](https://static-a1.steveyi.net/media/blog/2020053018054471.jpg)

完成！

### 參考資料：

[https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/#sit](https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/#sithttps://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/https://github.com/sskaje/6in4https://www.ciscopress.com/articles/article.asp?p=2154680)  
[https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/](https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/#sithttps://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/https://github.com/sskaje/6in4https://www.ciscopress.com/articles/article.asp?p=2154680)  
[https://github.com/sskaje/6in4](https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/#sithttps://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/https://github.com/sskaje/6in4https://www.ciscopress.com/articles/article.asp?p=2154680)  
[https://www.ciscopress.com/articles/article.asp?p=2154680](https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/#sithttps://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/https://github.com/sskaje/6in4https://www.ciscopress.com/articles/article.asp?p=2154680)
