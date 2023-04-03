---
title: 'Using AS-SET to build filters'
date: 2021-06-27T05:35:35+08:00
draft: false
tags: ['Internet', 'BGP']
---

Recently, in order to establish BGP Peers with some friends who are new to the field, I also taught them how to use AS-SET for filtering.

### What is AS-SET

AS-SET is an object that can add ASN and AS-SET.  
Usually used to filter routes exchanged through the BGP protocol. (such as BGP Peer Neighbor, Internet Exchange Route Server, etc.)

We usually query all Route Objects in this AS-SET through Whois and recursion.

For example, today we want to filter a certain BGP Peer through AS-STEVEYI.  
First, query which ASN is in this AS-SET through whois, and then continue to query other AS-SETs in this AS-SET (here is AS-STEVEYI-C).

```command
$ steveyiyo@steveyi-MBP ~ % whois -r AS-STEVEYI
as-set:         AS-STEVEYI
descr:          SteveYi Network Service
members:        AS17413
members:        AS60614
members:        AS141173
members:        AS209557
remarks:        --- DownStream ---
members:        AS-STEVEYI-C
remarks:        ----------
tech-c:         YT1698-RIPE
admin-c:        YT1698-RIPE
mnt-by:         STEVEYI-MNT
created:        2020-09-10T18:57:46Z
last-modified:  2021-03-26T15:31:21Z
source:         RIPE
```

Then, we can query the corresponding Route Object record through [RADB](https://www.radb.net/).

![](https://static-a1.steveyi.net/media/blog/1624742087.png)

We can build the filter based on this rule!

### Building Filters

First, I recommend a tool for building filters - [bgpq3](https://github.com/snar/bgpq3)  
It can generate filters for ASN or AS-SET, and supports many routing packages or routing systems!

```
# Can be installed directly through apt
$ sudo apt install bgpq3
```

```
# Generate IPv4 prefix-list
$ bgpq3 -4l AS-STEVEYI_v4 AS-STEVEYI -R 24 -m 24

# Generate IPv6 prefix-list
$ bgpq3 -6l AS-STEVEYI_v6 AS-STEVEYI -R 48 -m 48
```

![](https://static-a1.steveyi.net/media/blog/1624742917.png)

Then, we can create a `route-map` to filter a certain BGP Peer

```conf
# vtysh
config
    route-map AS-STEVEYI_v4 permit 5
        match ip address prefix-list AS-STEVEYI_v4
        set community 60614:100
```

That's it!