---
title: 'Guide to PVE - Installation'
date: Tue, 07 Jul 2020 05:33:14 +0000
draft: false
tags: ['Server', 'Domain', 'Virtualization technology']
---

I've been playing with virtual machines for some time, but I used VMware Workstation on Windows systems. Later, I had a few idle computers and came across Proxmox VE, an open-source virtualization system. So, let's install and try it out!

Preparation:

- Proxmox VE installation disc
- A high-core and idle computer (otherwise, it will run very slowly)

First, let's go to the official website to download the PVE ISO file [Official website link](https://www.proxmox.com/en/downloads). Click on the left side of the [Proxmox VE 6.2 ISO Installer](https://www.proxmox.com/en/downloads/item/proxmox-ve-6-2-iso-installer) to download (6.2 is the version number, and the right side is the torrent download).

![](https://static-a1.steveyi.net/media/blog/2020070100471381.png)

After downloading, we write the file to the USB and make an installation disc. Here, I recommend using Etcher to write it [Official website link](https://www.balena.io/etcher/).

After making the installation disc, we enter the BIOS and adjust the boot order (set the installation disc as the first priority).

Then we can start the installation!

First, select the first option, "Install Proxmox VE."

![](https://static-a1.steveyi.net/media/blog/2020070705281974.png)

Then agree to the terms of service.

![](https://static-a1.steveyi.net/media/blog/2020070705274149.png)

Select the hard disk.

![](https://static-a1.steveyi.net/media/blog/2020070705275335.png)

Select the country and time zone.

![](https://static-a1.steveyi.net/media/blog/2020070705280757.png)

Set the root password and email address.

![](https://static-a1.steveyi.net/media/blog/2020070705282498.png)

Set the hostname and network (I recommend setting it up at once, otherwise, it will be a bit tricky to change the IP later).

![](https://static-a1.steveyi.net/media/blog/2020070705283457.png)

After completing all the steps, click on "Install" to start the installation!

![](https://static-a1.steveyi.net/media/blog/2020070705284395.png)

After the installation is complete, we can use https://yourIP:8006 to enter the management panel!

In the next article, we will share some configuration processes with you.