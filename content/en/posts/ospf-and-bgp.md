---
title: "Optimizing Intranet with OSPF and BGP"
author: "SteveYi"
date: 2021-05-16T22:17:25+08:00
draft: false
---

For a long time, my friends and I have had an intranet similar to DN42. We use VPN to establish BGP connections and deploy this intranet using various devices in different areas.  
P.S. Currently, there are about 46 routes.

![](https://static-a1.steveyi.net/media/blog/1621242200.png)

Currently, I am building a BGP peer with other people from one point and using static routes to handle internal routing.

For example, if the device `10.121.23.242` wants to reach a device `10.121.210.3` on my intranet:

![](https://static-a1.steveyi.net/media/blog/1621238898.png)

For example, I set up a route `10.121.210.0/24` on the core router to the router placed in the school. On the school router, I established a BGP peer with the core router to receive the full table of our intranet.

![](https://static-a1.steveyi.net/media/blog/1621244817.png)

This can make our network work, but when the core router fails, others cannot enter my intranet.

So I thought of using OSPF and iBGP to solve the problem of a single core router failure.

## What is OSPF?

OSPF, short for Open Shortest Path First, is an IGP protocol that uses Link State Routing algorithm.

The IGP development team in IETF proposed [RFC 2328](https://datatracker.ietf.org/doc/html/rfc2328) in 1988 for IPv4 routing protocols.

At the time, because the RIP single path could only support up to 15 network devices, the RIP routing protocol was not suitable for large network environments, so the IGRP routing protocol was developed, and the OSPF protocol was developed at the same time.

Currently, OSPF is divided into two versions:

- [OSPF v2](https://datatracker.ietf.org/doc/html/rfc2328) (IPv4)
- [OSPF v3](https://datatracker.ietf.org/doc/html/rfc5340) (IPv6)

## Topology Design

The concept is as follows:

1. Establish BGP sessions with others on different core routers.
2. Establish OSPF connections with other POPs.

Once the route enters from any core of a POP, it will automatically route through the learned routes from OSPF.
