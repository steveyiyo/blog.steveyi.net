---
title: 'Backing up Installed Plugins with Redeb'
author: "SteveYi"
date: 2020-11-28T04:39:14+00:00
draft: false
tags: ["iOS"]
Author: 蘿蔔
---

A long time ago, the author encountered a situation where a plugin disappeared from another source, preventing them from installing the desired plugin. However, because the plugin was installed on another device, they were able to back up the deb file and install it on the desired device. This article is for those who want to back up their plugins!

*   ![](https://static-a1.steveyi.net/media/blog/2020112105432588.png)
    

Redeb and the backed up deb files (using Zebra as an example)

Plugins/programs required:  
Redeb - a deb repackaging and backup plugin (source: [https://wiety.github.io/cydia/](https://wiety.github.io/cydia/))  
OpenSSH - allows a computer to ssh into the device and execute commands  
FileZilla - SFTP access to the device (WinSCP can also be used for Windows users)  
Terminal - to execute ssh commands (PuTTY for Windows users)

Prerequisites:
-----

First, add this source to your plugin manager (using Zebra as an example): [https://wiety.github.io/cydia/](https://wiety.github.io/cydia/)

![](https://static-a1.steveyi.net/media/blog/2020112106035462.png)

Scroll down to "Wiety's beta repository" and find Redeb, then install it.

![](https://static-a1.steveyi.net/media/blog/2020112106052890.png)

Install OpenSSH (skip this step if it is already installed).

![](https://static-a1.steveyi.net/media/blog/2020112106070556.png)

Now you can move on to the computer.

Computer operations:
-------

Note that both the mobile device and the computer need to be connected to the same LAN, otherwise ssh cannot be connected!

First, check the internal IP address on the device you want to connect to (Settings -> Wi-Fi -> tap "i" on the connected Wi-Fi).

![](https://static-a1.steveyi.net/media/blog/2020112802475870.jpeg)

The author has created a shortcut to check the internal IP.

Open the terminal on the computer (Windows users should install PuTTY, the author uses macOS here).  
Type ssh root@192.168.31.46 in the terminal (replace the red part with your own internal IP).  
Enter the ssh password for the device you want to connect to (the default password is alpine. It is recommended to change it to your own password!)

![](https://static-a1.steveyi.net/media/blog/2020112802562966.png)

Type redeb in the terminal, and the message on the left will appear. This is because we did not specify the plugin ID in advance. Type "y" here. redeb will list all plugin IDs (right picture).

*   ![](https://static-a1.steveyi.net/media/blog/2020112803005671.png)
    
*   ![](https://static-a1.steveyi.net/media/blog/2020112803010555.png)
    

Type in the plugin ID you want to back up. Using Zebra as an example, the plugin ID is "206".

![](https://static-a1.steveyi.net/media/blog/2020112803044464.png)

After completing the operation, the terminal will look like this:

![](https://static-a1.steveyi.net/media/blog/2020112803075785.png)

You can now extract the deb file you just packaged from the device. Next, open FileZilla and ssh connect to the device you just packaged the deb file on.

In Filza, tap the button in the upper left corner to open the screen, add a new site, change the server type to SFTP, enter the host name (IP of the device you want to connect to), username (root), and password, then click Connect.

![](https://static-a1.steveyi.net/media/blog/2020112803123820.png)

After connecting, the backed up deb file is located at:

```
/private/var/mobile/Documents/Redeb/debs
```

![](https://static-a1.steveyi.net/media/blog/2020112803211495.png)

The files in the folder are the deb files you just backed up. That's it!
