---
title: "Solving the 53 Port Occupancy Issue on Ubuntu"
date: 2021-05-12T20:58:02+08:00
draft: false
---

Recently, in order to install a DoH Client on my router and set up a DNS server for internal network devices, I found that Ubuntu often uses port 53.

After checking, I found that this was caused by `systemd-resolve`, so I found these methods to disable it!

Before that, if you find that port 53 is being used, you can use the following command to see which process is using it.

```
sudo netstat -pna | grep 53
```

Then, let's solve the problem of `systemd-resolve` using port 53.

First, we edit the `/etc/systemd/resolved.conf` file.

```
sudo vi /etc/systemd/resolved.conf
```

We uncomment the line `DNSStubListener` and change it to `No`.

```
[Resolve]
#DNS=
#FallbackDNS=
#Domains=
#LLMNR=no
#MulticastDNS=no
#DNSSEC=no
#DNSOverTLS=no
#Cache=yes
DNSStubListener=no
#ReadEtcHosts=yes
```

Then, enter this command.

```
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
```

Finally, we restart the `systemd-resolved` service.

```
sudo systemctl restart systemd-resolved
```

Now, we can use port 53!