---
title: 'FRRouting Installation Tutorial'
author: "SteveYi"
date: 2020-07-12T13:07:14+0000
draft: false
tags: ["BGP", "Server"]
---

It's been a while since I last shared anything! Recently, I have been learning about BGP knowledge and testing. Previously, I used Bird1 to broadcast BGP, but when I tried to peer with my friend, we couldn't establish a connection (it was strange, but I could connect with IX). So I uninstalled Bird1 and installed [FRRouting](https://frrouting.org/) instead.

[FRRouting](https://frrouting.org/) is a routing suite that comes from Quagga Fork, and its functionality is also very powerful (its commands are similar to Cisco or Quagga).

User Guide (English): [https://docs.frrouting.org/en/latest/](https://docs.frrouting.org/en/latest/)  
GitHub project: [https://github.com/FRRouting/frr/releases](https://github.com/FRRouting/frr/releases)

First, we need to install [FRRouting](https://frrouting.org/).

### Update packages

```
sudo apt update -y
sudo apt upgrade -y

# Install network packages and GPG packages
sudo apt install -y curl gnupg2 traceroute
```

### Install FRRouting

```
# Import GPG
curl -s https://deb.frrouting.org/frr/keys.asc | sudo apt-key add -
FRRVER="frr-stable"

# Write software sources
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

### Activate all functions of FRRouting

```
sudo sed -i "s/=no/=yes/g" /etc/frr/daemons
service frr restart
```

### Enter FRRouting interactive CLI

```
sudo vtysh
```

After entering the interactive CLI, you can start configuring by typing "config".
