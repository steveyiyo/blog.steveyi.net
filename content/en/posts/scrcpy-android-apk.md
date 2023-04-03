---
title: 'Easily Install APK Files to Your Phone with Scrcpy'
date: Wed, 20 May 2020 08:52:47 +0000
draft: false
tags: ['Android']
Author: 蘿蔔
---

![](https://static-a1.steveyi.net/media/blog/2020052008515768.png)

First, we need to install Scrcpy and open it.  
[Installation instructions here](https://blog.steveyi.net/scrcpy-android)  

If you are using a Xiaomi phone (if not, skip this part),  
go to "Settings" > "Additional settings" > "Developer options" and allow USB installation.  
This action requires a SIM card to be inserted (required by MIUI).

![](https://static-a1.steveyi.net/media/blog/2020052014230696.jpg)

Please have the Finder or File Manager window for the prepared APK file open on the side, and drag the file into the Scrcpy window.  
(The phone screen can be anywhere, not necessarily on the app drawer screen)

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020052008324389.gif)

Then, Mac users should see text appearing in the terminal window:  
`Request to install...`  
as well as  
`Performing Push Install...`

![](https://static-a1.steveyi.net/media/blog/2020052008374716.png)

At this point, the phone is installing the APK file, and the installation time depends on the phone's speed.

If you are using a Xiaomi phone, please allow the installation on the phone, otherwise it may be blocked by the system and fail to install.

![](https://static-a1.steveyi.net/media/blog/2020052014251266.jpg)

  
When the installation is complete, the Mac terminal window will display "Success" to indicate successful installation.  
Tested programs installed in this way can also be opened normally.

![](https://static-a1.steveyi.net/media/blog/2020052008425289.png)

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020052008464950.gif)