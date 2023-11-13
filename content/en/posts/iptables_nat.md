---
title: "Setting up NAT on iptables"
author: "SteveYi"
date: 2021-03-08T13:20:00+08:00
tags: ["Network"]
draft: false
---
Recently, Xiaoyi installed Ubuntu 20.04 on a computer at home and used it as a soft router.

But Xiaoyi found that the computer couldn't connect to the internet!

After using `mtr` to trace the route, we found that the route could not go beyond the Gateway. So we captured packets on the router and found that our internal IP was sent to the ISP, but there was no response.

If the ISP hasn't configured it properly, it can easily lead to IP Spoofing.

Therefore, we need to set up packet conversion (NAT) here to be able to connect to the internet!

The iptables command for this is as follows (note: eth1 is the name of the public network card):
```
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
```

In addition, if you only want to allow a certain range of IP addresses to be converted to NAT, you can write it as follows:
```
iptables -t nat -A POSTROUTING -s 10.121.210.0/24 -o eth1 -j MASQUERADE
```
