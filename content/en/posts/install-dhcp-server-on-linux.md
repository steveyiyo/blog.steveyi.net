---
title: "Installing DHCP Server on Linux"
author: "SteveYi"
date: 2021-04-11T09:37:30+08:00
draft: false
---

I often use Linux systems as routers for the simple reason that virtual machines require them. But I thought, since I'm doing it anyway, why not write a blog post about it?

So... let's get started with the installation!

## Installing isc-dhcp-server

First, we need to install a package called `isc-dhcp-server`.

```
sudo apt install isc-dhcp-server
```

![](https://static-a1.steveyi.net/media/blog/install-dhcp-server-in-linux-01.png)

## Configuring DHCP Server

After installation, we need to edit the configuration file `/etc/dhcp/dhcpd.conf`. Here's an example:

```
option domain-name "network.steveyi.net"; # Domain name
option domain-name-servers 8.8.8.8; # DNS server

default-lease-time 600; # Default lease time
max-lease-time 3600; # Maximum lease time
authoritative;

# Subnet, allocated /24
subnet 10.121.210.0 netmask 255.255.255.0 {
    range 10.121.210.1 10.121.210.253;
    option subnet-mask 255.255.255.0;
    option routers 10.121.210.254;
}
```

Next, we need to edit the network interface for sending DHCP packets: `/etc/default/isc-dhcp-server`.

![](https://static-a1.steveyi.net/media/blog/install-dhcp-server-in-linux-02.png)

Finally, enter `service isc-dhcp-server restart`. That's it!
