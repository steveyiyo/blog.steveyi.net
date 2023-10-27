---
title: "Implementing Virtual WAN Multi-PPPoe on Linux"
author: "SteveYi"
date: 2021-07-19T08:47:55+08:00
draft: false
description: "I've been using Linux as a router for quite some time."
---

The other day, I remembered that my ISP (Chunghwa Telecom) at home can obtain 7 floating Public IPv4 Addresses through dial-up, so I decided to implement it!

## Environment

> The following information was generated through the [bench.sh](https://bench.sh) script.

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

## Create Virtual Network Card

First, we need to create several virtual WANs with different MacAddresses.  
These are what we need to use for PPPoe connections later.

* enp1s0 is the network card connected to the Chunghwa Telecom router, and the name can be customized afterwards.

> Here we create 7 virtual network cards first.

```
ip link add link enp1s0 name wan0 type macvlan
ip link add link enp1s0 name wan1 type macvlan
ip link add link enp1s0 name wan2 type macvlan
ip link add link enp1s0 name wan3 type macvlan
ip link add link enp1s0 name wan4 type macvlan
ip link add link enp1s0 name wan5 type macvlan
ip link add link enp1s0 name wan6 type macvlan
```

## Configure PPPoe Connection

> I use pppoeconf in Linux.  
> If it is not installed, you can install it with the following command.

```
sudo apt install pppoeconf
```

First, we enter pppoeconf and enter the account and password.

Next, go to the `/etc/ppp/peers` folder and copy the dsl-provider file to other files.  
And modify the network card name in the copied file (e.g. nic-wan1 -> nic-wan0).

![](https://i.imgur.com/06M8VBv.png)

Then use the command `pon <file name>` to enable the PPPoe connection.  
Then enter `ip addr` to see the list of network cards.

![](https://i.imgur.com/yg6Tx59.png)

That's it!
