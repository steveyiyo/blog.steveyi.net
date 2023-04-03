---
title: "Designating network egress by AS Number"
date: 2021-02-06T02:13:10+08:00
draft: false
image: "https://i.imgur.com/mgyCzFl.png"
---

In January of last year, I applied for my first ASN - [AS209557](https://whois.steveyi.net/whois/AS209557), and did a lot of cool experiments!

Today, I reconfigured my home router and can now designate which route to take based on ASN.

### First, let me introduce my router information

Ubuntu 20.04 software router  
Bird2 (Internet Routing Daemon)  
![](https://i.imgur.com/iKW3r01.png)

### Network environment (including VPN tunnel)

Chunghwa Telecom PPPoe non-fixed IP 100/40M  
To TANet's [WireGuard](https://wireguard.com/) Tunnel  
To GCP's [WireGuard](https://wireguard.com/) Tunnel  
To Vultr's [WireGuard](https://wireguard.com/) Tunnel  

The main idea is to route AS1659 and AS6939 through TANet, AS60614 through Vultr, and the rest through Chunghwa Telecom, while enabling NAT for all. The entire home network is in a VRF (vrf_HOME). PS. The following article will be directly integrated into the Kernel.

### Install bird2

First, we need to install bird2, which is a routing process software.  
It can handle BGP, OSPF, ISIS, Static Route, and other routes.

Debian & Ubuntu:
```
apt install bird2
```

CentOS:
```
yum install bird2
```

### BGP Configure

After installing bird2, we need to use eBGP Multihop to collect a full table.  
In theory, existing network providers will require you to have an IANA-approved ASN to peer.

However, we can also use Private ASN for peering (if the other side allows it).  
I recommend using Vultr's VPS to collect the full table, and you can refer to the article [Use BIRD to Announcing IPv6 on Vultr](https://blog.steveyi.net/posts/use-bird6-broadcast-ipv6-vultr/) for details.

Since we are Multihop, we cannot reach the routes sent by the other side.  
So we put the routes in the table.

```
ipv4 table global_v4;
```

Next, since we want to write to VRF, we first create a filter policy.  
If the ASN equals 60614, then the route is changed to 10.121.1.2. Others remain unchanged... and so on.

```
filter policy_routing {

        # TANet
        if bgp_path.last = 1659 then {
            gw = 10.121.208.254;
            accept;
        }

        # HE
        if bgp_path.last = 6939 then {
            gw = 10.121.208.254;
            accept;
        }
 
        # SteveYi Network Service
        if bgp_path.last = 60614 then {
            gw = 10.121.218.62;
            accept;
        }

        reject;
}
```

### Final

Since I adjusted the network again, currently only two routes are set up (:

![](https://i.imgur.com/mgyCzFl.png)

The code is roughly like this, you can try it out.  
I feel like I can also make a cool thing to automatically set up eBGP multihop (#
```
log syslog all;
router id 10.121.211.254;
# debug protocols all;
watchdog warning 5 s;
watchdog timeout 30 s;
ipv4 table global_v4;
ipv4 table policy_v4;
protocol device {}
protocol direct { ipv4; }
 
template bgp bgp_feeder {
    multihop;
    graceful restart on;
    ipv4 {
        table global_v4;
        import all;
        export none;
    };
}
 
protocol bgp SteveYi_Feed from bgp_feeder {
	local as 209557;
    neighbor as 60614;
    neighbor xxx.xxx.xxx.xxx;
}

define steveyi_asn = [
        60614,
        209557
];

filter policy_routing {
    # SteveYi Network Service
    if bgp_path.last ~ steveyi_asn then {
        gw = 10.121.217.11;
        accept;
    }

    # HE
    if bgp_path.last = 6939 then {
        gw = 10.121.218.62;
        accept;
    }

    reject;
}

# Prevent Feed from being eaten by BGP
protocol static
{
    ipv4;
	route 10.120.0.0/14 via 10.121.208.254;
}

protocol kernel
{
    scan time 20;
    ipv4 {
        table global_v4;
        import none;
        export filter policy_routing;
    };
}
```

### Reference articles & assisting partners

Thanks to [James Swineson](https://swineson.me/)'s [BGP at Home (1.5): My Dual-Line Traffic Splitting Rules](https://blog.swineson.me/zh/bgp-at-home-1-5-my-filter-rules/)  
Thanks to [奈特](https://who.nat.moe/) for providing bird2 usage assistance and tips  
Thanks to [Licson](https://licson.net/), [Nato Laboratory](https://internet.nat.moe/), [James Swineson](https://swineson.me/) for providing BGP Full Table