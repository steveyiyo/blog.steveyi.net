---
title: 'FRRouting Install Guide'
date: Sun, 12 Jul 2020 13:07:14 +0000
draft: false
tags: ['BGP', 'Server', 'Networl']
---

I have long time has not share new post. I still learning some BGP Knowledge and try to use bird1 to make BGP Session with another operators.

But I can not make BGP Session Establishment with a operator, so I uninstall bird1 and install [FRRouting](https://frrouting.org/)

## What's FRRouting?

[FRRouting](https://frrouting.org/) is a routing daemon fork from Quagga, has a lot of features (The commands look like Cisco or Arista :D)

User Guide: [https://docs.frrouting.org/en/latest/](https://docs.frrouting.org/en/latest/)  
GitHub Repository: [https://github.com/FRRouting/frr/releases](https://github.com/FRRouting/frr/releases)

Let us start to install FRRouting!

### Update Packages

```
sudo apt update -y
sudo apt upgrade -y

# Install Network Tools and GPG Packages
sudo apt install -y curl gnupg2 traceroute
```

### Install FRRouting

```
# Import GPG Key
curl -s https://deb.frrouting.org/frr/keys.asc | sudo apt-key add -
FRRVER="frr-stable"

# Add repository mirror
echo deb https://deb.frrouting.org/frr $(lsb_release -s -c) $FRRVER | sudo tee -a /etc/apt/sources.list.d/frr.list

# Install FRRouting
sudo apt update -y && sudo apt install -y frr frr-pythontools
```

### Enable IP forwarding

```
echo "
net.ipv4.conf.all.forwarding = 1
net.ipv6.conf.all.disable_ipv6 = 0
net.ipv6.conf.default.disable_ipv6 = 0
net.ipv6.conf.lo.disable_ipv6 = 0
net.ipv6.conf.default.forwarding = 1
net.ipv6.conf.all.forwarding = 1
net.ipv6.conf.all.proxy_ndp = 1
net.ipv6.conf.all.accept_ra = 2
" | sudo tee -a /etc/sysctl.conf

sudo sysctl -p
```

### Enable FRRouting All features

```
sudo sed -i "s/=no/=yes/g" /etc/frr/daemons
service frr restart
```

### Access FRRouting CLI mode

```
sudo vtysh
```

Once you go to the CLI Mode, you can configure the routing with the command `config`.