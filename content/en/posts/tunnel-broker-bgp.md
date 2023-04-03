---
title: 'Setting up Tunnel Broker Service (v4 to v6) on Ubuntu System'
date: Sun, 31 May 2020 16:56:41 +0000
draft: false
tags: ['VPS', 'Server', 'Domain']
---

### Introduction

I recently obtained an Autonomous System Number (AS Number), along with one /44 and two /48 IPv6 addresses. Coincidentally, I remembered using HE.Net's tunnel broker service before, so I decided to set up a sit tunnel broker service. This article does not explain how to obtain IPv6 addresses, please consult your hosting provider.

This article will use the open source tool - [IPv6-in-IPv4 Tunnel](https://github.com/sskaje/6in4.git).

### Configuration tool

First, download the tool:

```
git clone [https://github.com/sskaje/6in4.git](https://github.com/sskaje/6in4)
```

![](https://static-a1.steveyi.net/media/blog/2020053018041378.jpg)

We enter the etc folder of the project and modify config.ini:

```
nano config.ini
```

![](https://static-a1.steveyi.net/media/blog/2020053018044764.jpg)

Edit IPV6\_NETWORK, IPV6\_CIDR, INTERFACE, BIND\_IP (if there are multiple IPv4 addresses).

![](https://static-a1.steveyi.net/media/blog/2020053018050652.jpg)

Then press Crtl + X to save.

### Modify system settings to allow IPv6 forwarding

```
nano /etc/sysctl.conf  
  
Add the following line at the bottom: net.ipv6.conf.all.forwarding = 1  
  
Save with Crtl + X.  
sysctl -p
```

### Firewall

```
iptables -I INPUT -p 41 --j ACCEPT  
iptables -I OUTPUT -p 41 --j ACCEPT  
iptables -I FORWARD -p 41 --j ACCEPT
```

### Use the tool to create a server (add tunnel)

Assuming the tunnel ID is 1, the server IPv4 is 1.1.1.1, and the client IPv4 is 8.8.8.8.

The IPv6 subnet set in the configuration file is 2a0e:b107:7e0::, and the subnet mask is 48 (must be a multiple of 8). The tool will automatically split it into a /64 subnet for the tunnel and a /64 subnet for the user route.

If the client needs to allocate to lower-level devices, it is recommended that the server subnet be greater than /64 so that a lower-level /64 subnet can be generated to ensure the operation of SLAAC.

![](https://static-a1.steveyi.net/media/blog/2020053018052119.jpg)

Then we can configure the client! (The configuration process can refer to [https://tunnelbroker.net/](https://tunnelbroker.net/))

### Error: sipcalc required

I encountered this problem when adding the tunnel for the first time. The solution is as follows:

```
CentOS:  
yum install sipcalc  
Ubuntu/Debian:  
apt-get install sipcalc
```

### Test results

Test results from [https://test-ipv6.com/](https://test-ipv6.com/):

![](https://static-a1.steveyi.net/media/blog/2020053018053577.png)

Route trace:

![](https://static-a1.steveyi.net/media/blog/2020053018054471.jpg)

Done!

### References:

[https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/#sit](https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/#sithttps://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/https://github.com/sskaje/6in4https://www.ciscopress.com/articles/article.asp?p=2154680)  
[https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/](https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/#sithttps://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/https://github.com/sskaje/6in4https://www.ciscopress.com/articles/article.asp?p=2154680)  
[https://github.com/sskaje/6in4](https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/#sithttps://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/https://github.com/sskaje/6in4https://www.ciscopress.com/articles/article.asp?p=2154680)  
[https://www.ciscopress.com/articles/article.asp?p=2154680](https://developers.redhat.com/blog/2019/05/17/an-introduction-to-linux-virtual-interfaces-tunnels/#sithttps://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking/https://github.com/sskaje/6in4https://www.ciscopress.com/articles/article.asp?p=2154680)