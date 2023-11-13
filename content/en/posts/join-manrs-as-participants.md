---
title: "Become a MANRS participant!"
author: "SteveYi"
date: 2021-01-25T00:03:31+08:00
draft: false
tags: ["BGP", "Network"]
---

At the end of last year, I submitted an application for [MANRS](https://www.manrs.org/) for [SteveYi Network Service](https://network.steveyi.net/). At the beginning of this year, we passed the review and officially became a participant in MANRS! Our member introduction can be found here: [https://www.manrs.org/isps/participants/entry/1484/](https://www.manrs.org/isps/participants/entry/1484/)

So, let's talk about how we implement MANRS policies.

MANRS has four main policies, which are:

> Prevent propagation of incorrect routing information
> Prevent traffic with incorrect spoofed source IP addresses
> Promote coordination between network operators
> Facilitate global operational communication and coordination

So how do we achieve these?

> First, we block traffic from private IP addresses defined in [RFC1918](https://tools.ietf.org/html/rfc1918/) on our core routers. Traffic from these IP addresses will not be sent to the public network.
> Second, we comply with [RFC 8212](https://tools.ietf.org/html/rfc8212/) and do not broadcast unused network segments without explicit routing policies.
> Additionally, we generate corresponding IRR records from our [AS-STEVEYI](https://www.radb.net/query?keywords=AS-STEVEYI) and filter out routes that do not belong to us.

![](https://i.imgur.com/3YMIHgZ.png)

We also filter the peer routes of peers who establish private peering with us. We add all peer AS-SETs or ASNs to our [AS-STEVEYI-A](https://www.radb.net/query?keywords=AS-STEVEYI-A) and automatically generate corresponding IRR records to filter out invalid routes.

We also welcome network enthusiasts/engineers who are interested in our filtering system to contact us at info_at_steveyi_dot_net!
