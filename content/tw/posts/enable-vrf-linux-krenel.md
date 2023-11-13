---
title: '在 Linux 中開啟 VRF 模組'
author: "SteveYi"
categories: "科技"
tags: ["網路"]
date: 2021-07-06T02:26:41+08:00
draft: false
---

這幾天在裝新的路由器，由於是使用服務商提供的 Image，所以發現 VRF 模組沒有成功加載。

```command
root@eu-router:/opt/tunnel# modprobe vrf
modprobe: FATAL: Module vrf not found in directory /lib/modules/5.4.0-72-generic
```

我的 Linux Kernel 為 `5.4.0-72-generic`，這邊安裝一下擴充包。

```apt
apt install linux-modules-extra-`uname -r`
```

接著，在加載一下 VRF，沒有任何回應就代表成功囉！

```
modprobe vrf
```

[Virtual Routing and Forwarding (VRF)](https://www.kernel.org/doc/Documentation/networking/vrf.txt)
