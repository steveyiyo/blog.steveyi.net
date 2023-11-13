---
title: 'Building an Internal Network with Friends using BGP'
author: "SteveYi"
date: Sun, 24 Jan 2021 02:00:00 +0000
draft: false
tags: ["BGP", "Network"]
---

Hi! Long time no see!

In early 2020, I obtained my first ASN number - [AS209557](https://bgp.he.net/AS209557/)

I also used IP Addresses defined by [RFC 1918](https://tools.ietf.org/html/rfc1918), and with some friends, I built a large internal network using BGP and Internet tunnels.

So let's get started!

First, we use Ubuntu 20.04 to establish a tunnel and establish BGP peerings with others.

Usually, I use GRE, SIT, or WireGuard.

Among them, GRE or SIT tunnels are non-encrypted tunnels that can be viewed on the public network. To encrypt, IPsec needs to be configured.

WireGuard is a point-to-point tunnel launched in September 2019 and was included in the Linux kernel in March 2020.

(Actually, it was in Beta earlier, but when Xiaoyi used WireGuard, it was already a stable version.)

Next, here are my peer information and my friends' peer information.

PS. Some IP Addresses may differ from the actual IP Addresses used for security reasons.

My information

```
Public IP Address: 59.126.1.1
Tunnel IP Address: 10.0.0.1/30
```

Friend's information

```
Public IP Address: 140.113.1.1
Tunnel IP Address: 10.0.0.2/30
```

After the tunnel is established, let's try ICMP PING.

```
root@tw-stuin:~# ping 10.0.0.2
PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.
64 bytes from 10.0.0.2: icmp_seq=1 ttl=64 time=3.26 ms
64 bytes from 10.0.0.2: icmp_seq=2 ttl=64 time=3.22 ms
64 bytes from 10.0.0.2: icmp_seq=3 ttl=64 time=3.24 ms
--- 10.0.0.2 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 3.223/3.242/3.259/0.014 ms
```

Okay, it seems to be working!

Next, let's build a large internal network using the BGP protocol!

First, we need to install a BGP Routing Daemon on Linux.

Most people use [BIRD](https://bird.network.cz/) or [FRRouting](https://frrouting.org/) on Linux systems.

BIRD is more similar to the concept of programming(? FRRouting is similar to the concept of Cisco(?

At least that's how I think, but this article uses FRRouting for operation.

First, we can refer to [this article](https://blog.steveyi.net/frrouting-install/) to install FRRouting.

After installation, we enter Cli.
```
vtysh
```

Next, we enter the following command to enable BGP function. PS. If there is no public ASN, you can use Private ASN, which can refer to [RFC 6996](https://tools.ietf.org/html/rfc6996).
```
router bgp yourASN
```

Then, we enter the peer information.
```
neighbor 10.0.0.2 remote-as theASNoftheotherparty
```

Since it is an IPv4 Peer, we need to go to address-family ipv4 to do the settings. Similarly, if setting up IPv6, it is address-family ipv6.
```
address-family ipv4
```

Then, we can send our internal route to the peer. Note! Do not send routes that do not belong to yourself to others, otherwise it may cause [BGP hijacking](https://www.cloudflare.com/en/learning/security/glossary/bgp-hijacking/).

Here we send the 10.10.1.0/24 and 192.168.99.0/24 routes to the other party.
```
network 10.10.1.0/24
network 192.168.99.0/24
```

Here, it is also recommended to communicate with the other party in advance about the expected broadcast routes, so that the other party can set up filters to prevent one party from setting up incorrectly.

Postscript:

In theory, that's about it! But be sure to note that when pinging the other party, be sure to add the Source IP Address!! Because the other party may not receive the tunnel IP Address.

However, FRRouting added [RFC 8212](https://tools.ietf.org/html/rfc8212) in version 7.5.

If there is no clear routing policy, the route will not be written to the system routing table, nor will it send routes to the other party.
