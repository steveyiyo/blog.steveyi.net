---
title: 'Testing Internal Network Speed via iperf3'
author: "SteveYi"
date: 2020-11-08T13:26:11+0000
draft: false
tags: ["Servers"]
---

Recently, I replaced my switch and to test the speed of the internal network, I found this tool - [iperf3](https://iperf.fr/iperf-download.php)

It is a testing program that supports Windows, Linux, and macOS and is mainly operated through commands. I often use it to test the speed between two different servers in different locations.

![](https://static-a1.steveyi.net/media/blog/2020110813145837.png)

So, here's how to install it:

First, go to the [iperf3 official website](https://iperf.fr/iperf-download.php) and find the corresponding system (choose Windows for Windows, macOS for macOS, and Linux for Linux).

Download a .zip file and unzip it.

Then, open the command prompt (Terminal for macOS and Linux, can also be operated via SSH), enter `cd <folder path>`, and then enter the iperf3 command.

`iperf3 -s` # for the server side  
`iperf3 -c <server IP>` # for the client side

![](https://static-a1.steveyi.net/media/blog/2020110813255574.png)

Then it will start the speed test!

One thing to note is that in the internal network, it is necessary to ensure that the network is interconnected (the same LAN is interconnected).

![](https://static-a1.steveyi.net/media/blog/2020110813230558.png)

We can also use the ping command to test whether the network is connected. On some devices (such as Windows), ICMP may be blocked by default and needs to be specifically opened in the firewall.
