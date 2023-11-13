---
title: 'Building interconnectivity between different network segments through BGP'
author: "SteveYi"
date: 2020-08-11T18:56:26+00:00
draft: false
tags: ["BGP"]
---

As a child, I often struggled with managing my home network. For example, my home had three floors and three routers. I wanted to make sure that devices connected to each router could communicate with each other. However, if I turned on DHCP Server on each of the routers, the routers would become independent networks that couldn't communicate with each other.

Later, I discovered that by using a bridge to turn one router into a DHCP server and the others into AP or switch, I could achieve the same network and interconnectivity. 

However, this time we want to build a "remote network" that crosses L3, and we can't use the same DHCP Server to connect. Therefore, we will have two networks.

Previously, I shared a tutorial on [FRRouting installation](https://blog.steveyi.net/posts/frrouting-install/), so we can also use BGP and VPN Tunnel to build interconnectivity between different networks.

## Prerequisites

The router must be a Linux system or a router that can use BGP.  
e.g. RouterOS, Cisco IOS, Junos, etc.

Linux routing packages, recommended as follows:
- [FRRouting (FRR)](https://frrouting.org/)
- [BIRD](https://bird.network.cz/)

Router:
- R1
- R2

## Using FRRouting to Create BGP Interconnectivity

This article will use [FRRouting](https://frrouting.org/) as a demonstration.

PS. Both routers must support BGP, otherwise NAT devices must be used for interconnectivity.

### Configuring Router IP Addresses

First, we configure the IP addresses of the routers on both sides.

R1:
- `10.0.1.1/24`
- DHCP assigns `10.0.1.2 - 10.0.1.254`

R2:
- `10.0.2.1/24`
- DHCP assigns `10.0.2.2 - 10.0.2.254`

Then we announce `network 10.0.1.0/24` from router A to B. Correspondingly, router B announces `network 10.0.2.0/24` to A.

## Checking Status

After the BGP Session between the two sides is established, we check the system routing table `ip route`.

You should see the following route:  
`10.0.1.0/24 via peer_tunnel_ip dev tunnel0 proto bgp metric 20`

Then you can try using mtr or ping to see if the devices behind the other router's network are connected!

## Configuration File

R1

```
Current configuration:
!
frr version 7.3.1
frr defaults traditional
hostname gateway-tw
log syslog informational
service integrated-vtysh-config
!
router bgp 209557
 neighbor 10.121.1.22 remote-as 209557
 neighbor 10.121.1.22 description JP-Gateway
 !
 address-family ipv4 unicast
  network 10.0.1.0/24
 exit-address-family
!
line vty
!
end
```

R2

```
Current configuration:
!
frr version 7.3.1
frr defaults traditional
hostname gateway-tw
log syslog informational
service integrated-vtysh-config
!
router bgp 209557
 neighbor 10.121.1.21 remote-as 209557
 neighbor 10.121.1.21 description TW-Gateway
 !
 address-family ipv4 unicast
  network 10.0.2.0/24
 exit-address-family
!
line vty
!
end
```

After completion, the effect will be similar to this:

![](https://static-a1.steveyi.net/media/blog/2020081118552052.png)

## Follow-up

If you do not want to use BGP or OSPF, you can also add a Static Route directly using the `ip route` command.

```shell
ip route add 10.0.1.0/24 via peer_tunnel_ip dev tunnel_interfaces
```
