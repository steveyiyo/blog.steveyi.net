---
title: "Setting up Policy Based Routing with FRRouting"
author: "SteveYi"
date: 2021-05-18T16:23:58+08:00
draft: false
---

A few days ago, I was adjusting the network architecture in my lab to allow everything to go out through VPN and access my intranet. This led me to research Policy Based Routing (PBR).

I initially used VRF (Layer 3 switching) to isolate my network, but this prevented me from running my services on the VRF interface. This meant that I couldn't set up DoH on the router.

Later, I discovered that I could use other methods to achieve PBR without using VRF.

## What is PBR?

PBR stands for Policy Based Routing, which is a technique that allows control over routing or packet direction by modifying the next hop IP address.

## How to achieve PBR in Linux?

There are many ways to achieve PBR in Linux, such as using a Routing Daemon or using the `ip link` and `ip rule` commands.

```
# For example, if I want to put the 10.121.210.0/24 route in a table
ip rule add from 10.121.210.0/24 lookup TW

# And let its network go out through the VPN interface
ip route add 0.0.0.0/0 via 10.121.210.0/24 dev VPN-JP table TW
```

But in this case, I would have to run a script every time I boot up.

But I didn't want to set up PBR through a script.

![](https://static-a1.steveyi.net/media/blog/1621326935.png)

So I checked if the FRRouting suite had any PBR-related functionality, and it actually did!

After carefully reading the [official documentation](https://docs.frrouting.org/en/latest/pbr.html), we can start implementing it.

If you haven't installed FRRouting yet, you can refer to [this article](https://blog.steveyi.net/frrouting-install/) to install it.

## Setting up PBR

Our current requirement is:

```
# VPN tunnel
IP Address: 10.121.99.0/31
Gateway: 10.121.99.1/31

# Intranet
Route: 10.120.0.0/14
Gateway: 10.121.208.254

# Used for machines and physical computers within the server
10.121.210.0/24

# Requirement
Default route sent to VPN endpoint, and SNAT is set up.
```

So we can enter these commands to add rules:

- interface <interface_name>
    - PBR Policy

- nexthop-group <custom_name>
    - nexthop <next hop, theoretically the VPN endpoint>

- pbr-map <custom_name> seq <priority>
    - match <source IP or destination IP>
    - set nexthop-group <name defined above>
    - `# If matched, then bind to the rule we just created`

```
interface ens19
 pbr-policy VPN
!
interface tun1
 pbr-policy VPN
!
nexthop-group JP
 nexthop 103.156.184.1
!
nexthop-group STUIN
 nexthop 10.121.208.254
!
pbr-map VPN seq 5
 match dst-ip 10.120.0.0/14
 set nexthop-group STUIN
!
pbr-map VPN seq 10
 match src-ip 10.121.210.0/24
 set nexthop-group JP
!
```

Finally, we can enter the command `show pbr nexthop-groups` to view the current rules!

![](https://static-a1.steveyi.net/media/blog/1621331786.png)
