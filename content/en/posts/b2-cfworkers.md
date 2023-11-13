---
title: 'Setting up Custom Domain Name for Backblaze B2 with Cloudflare Workers'
author: "SteveYi"
date: 2020-02-26T20:36:28+0000
draft: false
tags: ["server", "website logs", "CDN"]
---

When building a website, it is important to consider issues related to image storage and traffic.

Initially, I stored the images and website on the same web server, but later found that the server space was often insufficient (because the system automatically backed up, causing insufficient space).

Later, I placed the images on [OneDrive](https://onedrive.com) Business Edition and used it with [OneList](https://github.com/MoeClub/OneList/), but since it was an unofficial API, when the API request rate was too fast, the images failed to load.

After the failure of [OneDrive](https://onedrive.com), I placed the images on [Google Drive](https://drive.google.com) and used it with [rclone](https://rclone.org), but... the website loading speed was slow! (And traffic also exploded) Finally, I found [Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html) XD

# What is Backblaze?

Backblaze is a data storage provider that offers two products:
- [B2 Cloud Storage](https://www.backblaze.com/b2/cloud-storage.html) is an object storage service similar to Amazon S3, which is cost-effective and comes with free egress traffic when used with Cloudflare CDN!
- [Cloud Backup](https://www.backblaze.com/cloud-backup.html) is an unlimited space computer backup service.

If you are interested in learning more, please refer to the [Backblaze website](https://www.backblaze.com).

# Resources Required

- Cloudflare CDN
- Cloudflare DNS
- Cloudflare Workers
- Backblaze B2

# Tutorial

1. First, go to Cloudflare and click `+ Add a Site` to add a domain.

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-01-1920x1082.png)

2. After adding, click Workers on the right to enter Cloudflare Workers. Then click Create a Worker to create a new Worker.

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-02-1920x407.png)

3. Paste the code at the bottom of the article into the left Script and modify the following three parameters:

- b2Domain
- b2Bucket
- b2UrlPath

After completion, click Save and Deploy below.

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-03-1920x967.png)

4. Then we enter the newly added domain and add a CNAME record (the following is an A record... I forgot to change it xDD).

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-04-1920x469.png)

5. After adding the CNAME record, click Workers above, then click Add route.

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-05-1920x693.png)

6. Next, we need to set it up. 

1. Fill in the `newly added subdomain/*` part of the Route, e.g. `img.steveyi.net/*.`
2. Choose the newly added Worker for Worker.

![](https://static-a1.steveyi.net/media/blog/2020/04/B2-CFWorkers-06.png)

That's it!

# Cloudflare Workers Code

[Code Author / Source](https://jross.me/free-personal-image-hosting-with-backblaze-b2-and-cloudflare-workers/)

```javascript
'use strict';
const b2Domain = 'static-a1.steveyi.net'; //The Backblaze domain you want to bind to Cloudflare.
const b2Bucket = ''; //The storage bucket name of Backblaze B2
const b2UrlPath = `/file/${b2
