---
title: "Using Linux to accomplish virtual WAN with multi PPPoE"
date: 2021-07-19T08:47:55+08:00
draft: false
description: "I use linux as router for a while. Recently, I'm trying to ..."
---

I use Linux as a router for a while. Recently, I remember I can use PPPoE to get 7 IPs from Chunghwa Telecom (aka Hinet).

So let's try it!

## Environment

> The below details is generate by [bench.sh](https://bench.sh/)

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

## Create Virtual Interface

First, We need to create some virtual interfaces, and make sure the MAC Address is not the same.
We'll use it for PPPoE connection.

* enp1s0 is the physical interface which is connect to the router of Hinet.

> Create 7 virtual interfaces

```
ip link add link enp1s0 name wan0 type macvlan
ip link add link enp1s0 name wan1 type macvlan
ip link add link enp1s0 name wan2 type macvlan
ip link add link enp1s0 name wan3 type macvlan
ip link add link enp1s0 name wan4 type macvlan
ip link add link enp1s0 name wan5 type macvlan
ip link add link enp1s0 name wan6 type macvlan
```

## Setup PPPoE connection

> I use pppoeconf in Linux. If you haven't, please use following the command to install it.

```
sudo apt install pppoeconf
```

Going to pppoeconf, and add the connection details to the configure file.

And then, we can going to `/etc/ppp/peers` folder, and make the dsl-provider file as copy.

Edit the interface name (Eg: nic-wan1 -> nic-wan0)

![](https://i.imgur.com/06M8VBv.png)

Final, You can use `pon <filename>` command to enable pppoe connection.

Once everything is ok. You can use `ip addr` to see the interface list.

![](https://i.imgur.com/yg6Tx59.png)

That's all!