---
title: 'Backblaze B2: Affordable Cloud Data Storage Service'
date: Mon, 11 May 2020 09:35:00 +0000
draft: false
tags: ['Object Storage', 'Website Logs']
---

When I was learning how to build a website, I considered a problem!  
If my traffic suddenly increased and I had more articles, would my image storage and bandwidth also increase?  
So I searched for some object storage services online and found a cheap object storage provider - [Backblaze](https://www.backblaze.com/).

What is Object Storage?
-------

Object storage is a type of data storage where each data unit is stored as a discrete unit called an object.  
Objects are static files such as PDFs, MP3s, images, videos, etc.  
These objects can actually be any type of data and any size of data.  
All objects in object storage are stored in a single flat address space, without a folder hierarchy.

Some well-known providers include [AWS S3](https://aws.amazon.com/s3/), [Google Cloud Storage](https://cloud.google.com/storage), [Backblaze B2](https://www.backblaze.com/b2/cloud-storage.html), [DigitalOcean Space](https://www.digitalocean.com/products/spaces/), and more.

Today, we will introduce Backblaze B2.

Advantages of Backblaze B2
---------------

[Backblaze B2's price is 1/4 that of Amazon S3  
](https://www.backblaze.com/b2/cloud-storage-pricing.html)[Combine with CloudFlare CDN for free traffic fees  
](https://www.cloudflare.com/bandwidth-alliance/backblaze/)[Supports S3 API](https://www.backblaze.com/blog/backblaze-b2-s3-compatible-api/)

Register an account
----

First, go to the official website and click Sign Up in the upper right corner.

![](https://static-a1.steveyi.net/media/blog/2020051108120980.png)

Then enter your account password and choose your data placement area (basically choose US West).

![](https://static-a1.steveyi.net/media/blog/2020051108143529.png)

Then verify your account in your email! Done.

![](https://static-a1.steveyi.net/media/blog/2020051108170997.png)

Create a Bucket
--------

After logging in to your account, click Creat a Bucket in the middle.

Then enter the bucket name, which cannot be the same as someone else's.  
Then choose "Public" (if you use it for backups or private files, choose "Private").

![](https://static-a1.steveyi.net/media/blog/2020051108354195.png)

Then we will see the bucket we just created.

![](https://static-a1.steveyi.net/media/blog/2020051109002920.png)

Create an App Key
---------

Although we can upload files on the website, the website only supports files up to 500MB.  
If it exceeds this limit, we must use the API to upload it. So here, we will teach you how to create an App Key.

First, click on App Keys on the left.

![](https://static-a1.steveyi.net/media/blog/2020051109051012.png)

Then click Add a New Application Key.

![](https://static-a1.steveyi.net/media/blog/2020051109090292.png)

Enter the App Key name and the allowed Bucket.  
Then click Create a new key.

![](https://static-a1.steveyi.net/media/blog/2020051109160381.png)

Then the API information will be generated. Write down the S3 EndPoint, Key ID, and applicationKay.

![](https://static-a1.steveyi.net/media/blog/2020051109185118.png)

Upload/Download Files
-------

There are many tools to upload or download files on Windows/Mac, but I recommend using [Cyberduck](https://cyberduck.io/).  
If you are using Linux, I think [Rclone](https://rclone.org) is a good choice.

PS. You can choose S3 API or Backblaze API to connect.

Summary
--

Backblaze is truly the most affordable static storage service I have found.  
The price is super competitive! And you can bind a custom domain and CDN with Cloudflare.  
I don't know if you have noticed, but the images on this site are all placed on Backblaze and accelerated with Cloudflare CDN!