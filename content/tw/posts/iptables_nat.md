---
title: "在 iptables 上設定 NAT"
date: 2021-03-08T13:20:00+08:00
tags: ['Network']
draft: false
---
不久之前，小易將家裡的一台電腦裝上了 Ubuntu 20.04，並把它當成了軟路由在使用。

但小易發現了一件事情，就是電腦沒辦法上網RRR！

我們透過 mtr 追蹤路由後發現...  
路由送到 Gateway 就出不去了，於是我們在路由器上抓包發現  
我們的內部 IP 發給 ISP 了。但沒有回程。

如果 ISP 沒有設定好的話，就容易導致 IP Spoofing。  

所以我們必須要在這邊設定好封包轉換(NAT)，才可以上網！

在 iptables 上的指令為這樣（注意：eth1 是公網網卡名稱）
```
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
```

另外，如果只想允許某段網段轉換為 NAT，則可以寫成
```
iptables -t nat -A POSTROUTING -s 10.121.210.0/24 -o eth1 -j MASQUERADE
```