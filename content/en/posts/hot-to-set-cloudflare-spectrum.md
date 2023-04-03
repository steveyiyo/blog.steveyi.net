---
title: 'Cloudflare New Service Spectrum Setup Tutorial'
date: Wed, 15 Apr 2020 08:50:06 +0000
draft: false
tags: ['Cloudflare', 'Server']
---

This morning when I opened [Facebook](https://facebook.com/), I found that [Cloudflare](https://cloudflare.com/) has launched a new service - [Spectrum](https://cfl.re/3efcOhv). It is currently available to all paid users, and I don't know if there will be a chance to open it to free customers in the future. Official blog link: [https://cfl.re/3efcOhv](https://cfl.re/3efcOhv)

Coincidentally, I have several domains that use the Plesk Plus service (this service has been discontinued), which is considered Cloudflare Pro version, so I can also activate this feature!

So let's record the setup process.

First, go to domain settings and select Spectrum at the top. Then click Enable [Spectrum](https://cfl.re/3efcOhv).

![](https://static-a1.steveyi.net/media/blog/2020050916443011-1920x1142.png)

After activation, click Create an application.

![](https://static-a1.steveyi.net/media/blog/2020050916445886-1920x1142.png)

Choose SSH (port 22) or Minecraft (port 65535) (if using Enterprise version, you can use RDP).

![](https://static-a1.steveyi.net/media/blog/2020050916452556-1920x1142.png)

Then enter the subdomain and IP address, and click Save.

![](https://static-a1.steveyi.net/media/blog/2020050916455234-1920x1142.png)

Now we just need to wait for it to take effect!

You can use the terminal (dig domain name) or [Google Public DNS](https://dns.google/) to check the CNAME record.

![](https://static-a1.steveyi.net/media/blog/2020050916461922-1920x1142.png)

Currently, this service provides:

- 5GB traffic/month for Pro version
- 10GB traffic/month for Business version
- Over 1GB, billed at $0.1/GB

[https://www.cloudflare.com/products/cloudflare-spectrum/](https://www.cloudflare.com/products/cloudflare-spectrum/)

![](https://static-a1.steveyi.net/media/blog/2020050916464540-1920x1142.png)

For those who are struggling with DDoS defense, you can give it a try!