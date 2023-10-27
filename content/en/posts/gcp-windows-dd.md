---
title: 'Windows 10 DD Image specifically for GCP'
author: "SteveYi"
date: Tue, 27 Aug 2019 15:07:49 +0000
draft: false
tags: ['VPS', 'Server']
---

Recently, in order to use VPS on GCP, I created a Windows DD image during a period of time. 
The images are:

1. Traditional Chinese version of Windows 10 Workstation Professional Edition
2. English version of Windows 10 Workstation Professional Edition (not uploaded yet)

The image has the following features:

*   Integrated with Virtio driver and Google Virtio Ethernet Adapter network card driver, suitable for GCP VPS servers
*   Unattended installation without VNC interaction. Once DD is completed, you can remotely log in to the desktop
*   Made based on VOL version, so the system can be activated by KMS method
*   Turn on Windows Remote Desktop

Traditional Chinese version
Download link: http://static-a1.steveyi.net/mirror/dd/win10.gz

Remote login information
Username: Administrator
Password: steveyigame.com
