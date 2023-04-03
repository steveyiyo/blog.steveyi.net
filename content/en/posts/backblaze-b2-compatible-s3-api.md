---
title: 'Backblaze B2 now supports S3 API!'
date: Thu, 14 May 2020 03:08:02 +0000
draft: false
tags: ['server', 'object storage', 'domain']
---

A few days ago, when I opened Backblaze, I saw a big line of text:

![](https://static-a1.steveyi.net/media/blog/2020051402585860.png)

That's right! Backblaze B2 now supports the S3 API!

The S3 API is currently the most popular protocol in the market, and many hardware and software are compatible.

Backblaze B2 is a great cloud storage option with a low cost advantage.

How to use the S3 API
----------

If the storage bucket was created before May 4, 2020, you will need to create a new one and move your files into it (we recommend using [Rclone](https://rclone.org), which will automatically support [B2 Copy File](https://www.backblaze.com/b2/docs/b2_copy_file.html)).

Then create a new App Key (don't use the main one).

Here are some articles about Backblaze B2:

[Backblaze B2 - Affordable Cloud Storage Service](https://blog.steveyi.net/backblaze-b2/)  
[Backblaze B2 and Cloudflare Workers Configuring Custom Domain](https://blog.steveyi.net/b2-cfworkers/)  
[BackBlaze Announces First European Data Center](https://blog.steveyi.net/backblaze-eu-central/)