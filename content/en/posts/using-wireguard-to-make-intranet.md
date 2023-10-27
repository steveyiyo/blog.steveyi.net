---
title: 'Building an Internal Network with WireGuard'
author: "SteveYi"
date: Fri, 20 Nov 2020 18:31:04 +0000
draft: false
tags: ['VPS', 'server']
---

Hi everyone, today I'm going to share how to use WireGuard to build an internal network.

Previously, I shared [how to install WireGuard on Linux systems](https://blog.steveyi.net/how-to-install-wireguard/). This time, we will use WireGuard to build an internal network.

## Why Build an Internal Network?

Why does the author call this an "internal network"? Because the author may be in different places and wants to use this opportunity to add them all to the same LAN.

This can also solve some connection problems, such as the author often connecting back to the computer at home. But because there are only a few public IP addresses, when there are too many machines, internal network penetration needs to be set up.

But after the author set up the internal network, they only need to connect to the VPN outside, and in other network areas, they can access all network devices (which is similar to remote access in general enterprises).

## Scenario and Architecture

So, as before, we need a main server as the gateway. However, we do not use NAT TO NAT, but instead let Private directly connect with each other.

Our scenario is like this:

- Office A Router 10.121.208.254/24
- Office B Router 10.121.209.254/24
- Office C Router 10.121.210.254/24
- VPN Router 10.121.211.254/24

## Configuring VPN Tunnel and Static Routing

First of all, since we are purely setting up an internal network this time, WireGuard with static routing is the main focus. So we won't talk about routing protocols. If you are interested, you can also refer to my article [Building Different Network Segments Communication Through BGP](https://blog.steveyi.net/posts/bgp-network-peer/).

We need a main router and connect the routers in offices A, B, and C through it.

So it becomes like this:
```
VPN <-> A  
VPN <-> B  
VPN <-> C
```
When a user from A wants to go to C (10.121.208.1 <-> 10.121.210.2), the route becomes...

User-A -> 10.121.208.254 -> 10.121.211.254 -> 10.121.210.254 -> User-C

That is, User-A -> A's router -> VPN gateway -> C's router -> User-C

Now that we understand the principle, let's implement it!

First, I prepare the private key and public key (the public key is calculated from the private key).

```
A's Public key: WGokwN2HtiX+naa7hdvUaXoXk5tkzXQtMge4v9DKlVw=  
B's Public key: fVNXw6EpC65DmIsY/XsWXL6EXLU9oFW7CL5cZr82Di8=  
C's Public key: ORbEFZlR/IWFWaD42Nh00DfYEpCX2CbNmRy/Hc+crVQ=  
VPN's Public Key: Rxcti9/3jLII4JOscHn9/yp5Z8ZROcYk8tugXn/FRHM=
```

So we write it in the configuration like this...

```
[Interface]
PrivateKey = <Private Key of each place>
Address = <IP of each router, for example, A's router 10.121.208.254/24>

[Peer]
PublicKey = <VPN Gateway Public Key>
Endpoint = <VPN Gateway's EndPoint>
AllowedIPs = 10.121.209.0/24,10.121.210.0/24,10.121.211.0/24
PersistentKeepalive = 10
```

We configure it like this on each node, the above example is for A's router, and B's router is like this:

```
[Interface]
PrivateKey = <Private Key of each place>
Address = <IP of each router, for example, B's router 10.121.209.254/24>

[Peer]
PublicKey = <VPN Gateway Public Key>
Endpoint = <VPN Gateway's EndPoint>
AllowedIPs = 10.121.208.0/24,10.121.210.0/24,10.121.211.0/24
PersistentKeepalive = 10
```

I believe everyone should be able to configure C's router.

Finally, all you need to do is execute the command `wg-quick up <wireguard_interface_name>` on each router to communicate with each other!

Special note: If the VPN gateway fails in this network architecture, then A, B, and C cannot communicate with each other.
