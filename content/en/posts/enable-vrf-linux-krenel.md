---
title: 'Open VRF Module in Linux'
date: 2021-07-06T02:26:41+08:00
draft: false
---

Recently, I installed a new router and found that the VRF module did not load successfully because I was using the image provided by the service provider.

```command
root@eu-router:/opt/tunnel# modprobe vrf
modprobe: FATAL: Module vrf not found in directory /lib/modules/5.4.0-72-generic
```

My Linux Kernel is `5.4.0-72-generic`, so I installed the extension package.

```apt
apt install linux-modules-extra-`uname -r`
```

Then, load the VRF module again. If there is no response, it means that it was successful!

```
modprobe vrf
```

[Virtual Routing and Forwarding (VRF)](https://www.kernel.org/doc/Documentation/networking/vrf.txt)