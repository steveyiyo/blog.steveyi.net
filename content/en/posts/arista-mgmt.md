---
title: "Configuring OOB Network on Arista"
date: 2022-07-05T02:58:47+08:00
draft: false
description: "Recently deployed an Arista switch. As L3 Routing was configured on this switch, it was not possible to set the OOB network as the default route..."
author: SteveYi Yo
---

Recently deployed an Arista switch. As L3 Routing was configured on this switch, it was not possible to set the OOB network as the default route.

To solve this problem, we created a VRF to isolate the OOB network.

## Configuration Steps

First, we define a new VRF and rd

```
vrf definition OOB
   rd 10:1
```

Next, we configure the MGMT interface

```
interface Management1
   vrf forwarding OOB
   ip address 10.39.0.2/24
```

Set a static route and enable the routing feature of VRF

```
ip route vrf OOB 0.0.0.0/0 10.39.0.1
ip routing vrf OOB
```

Then, `show ip route vrf OOB` can be entered to view the configured routes

```
arista#show ip route vrf OOB

VRF name: OOB
Codes: C - connected, S - static, K - kernel, 
       O - OSPF, IA - OSPF inter area, E1 - OSPF external type 1,
       E2 - OSPF external type 2, N1 - OSPF NSSA external type 1,
       N2 - OSPF NSSA external type2, B I - iBGP, B E - eBGP,
       R - RIP, I L1 - ISIS level 1, I L2 - ISIS level 2,
       O3 - OSPFv3, A B - BGP Aggregate, A O - OSPF Summary,
       NG - Nexthop Group Static Route, V - VXLAN Control Service

Gateway of last resort:
 S      0.0.0.0/0 [1/0] via 10.39.0.1, Management1

 C      10.39.0.0/24 is directly connected, Management1
```

## Testing

Use `ping vrf OOB ip 1.1.1.1` to test connectivity

```
arista#ping vrf OOB ip 1.1.1.1 
PING 1.1.1.1 (1.1.1.1) 72(100) bytes of data.
80 bytes from 1.1.1.1: icmp_seq=1 ttl=59 time=0.623 ms
80 bytes from 1.1.1.1: icmp_seq=2 ttl=59 time=0.417 ms
80 bytes from 1.1.1.1: icmp_seq=3 ttl=59 time=0.419 ms
80 bytes from 1.1.1.1: icmp_seq=4 ttl=59 time=0.460 ms
80 bytes from 1.1.1.1: icmp_seq=5 ttl=59 time=0.460 ms

--- 1.1.1.1 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4ms
rtt min/avg/max/mdev = 0.417/0.475/0.623/0.080 ms, ipg/ewma 1.004/0.548 ms
```