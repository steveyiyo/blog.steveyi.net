---
title: 'Use IFTTT to Turn off Wi-Fi When Leaving Home'
author: "SteveYi"
date: Wed, 03 Jun 2020 04:43:06 +0000
draft: false
tags: ["Android", "Life Tips"]
Author: 蘿蔔
---

As I often forget to turn off Wi-Fi when leaving home, I found this method to solve the problem.

First, we need to prepare according to different device types.

For Xiaomi, Redmi, Black Shark, and POCO phone users
--------------------------

First, lock and allow IFTTT to self-start and set the power-saving policy to unrestricted from the recent apps. Skip this section if not applicable.

Press and hold the IFTTT preview icon to bring up the menu below.

![](https://static-a1.steveyi.net/media/blog/2020060303272613.jpg)

Next, confirm that there is a small lock next to IFTTT, open the app details, allow self-start, and set the power-saving policy to unrestricted to avoid being killed in the background.

![](https://static-a1.steveyi.net/media/blog/2020060303282266.jpg)

For Android 6.0 to 8.0  
(Except for Xiaomi, Redmi, Black Shark, and POCO phone users)
------------------------------------------------

After installation, go to System Settings > Battery (or Power).

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-8.png)

Depending on the operating system, there may be different ways to operate. For Google phone, click the three dots in the upper right corner first, and then click Optimize battery usage.

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-9.png)

Then find IFTTT in the menu and choose not to optimize to avoid abnormal function caused by the background process being unable to run.

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-10.png)

For Android 9.0 to 10.0  
(Except for Xiaomi, Redmi, Black Shark, and POCO phone users)
-------------------------------------------------

Please go to System Settings > App and notification > Special app access. Depending on the operating system, there may be different ways to operate. For Google phone, click Special app access first.

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-11.png)

Then click Optimize battery usage.

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-12.png)

After finding IFTTT, choose not to optimize.

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-13.png)

Prepare work is completed.

Let's start setting up on the next page! Don't miss it ~
------------------

Before using, you need to register or log in to IFTTT ([ifttt.com](https://ifttt.com/)).

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-1.png)

Next, it will recommend an IFTTT example, click X to skip.

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-2.png)

Next, please open the IFTTT app.

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-14.png)

Next, please log in to the account used at the beginning of this article.

Click Got it and Get More.

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-15.png)

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-16.png)

Next, click Create.

![](https://static-a1.steveyi.net/media/blog/2020060303435439.png)

First click "This" and select Android Device.

![](https://static-a1.steveyi.net/media/blog/2020060303470354.jpg)

![](https://static-a1.steveyi.net/media/blog/2020060303485738.png)

Next, select the option circled below.

![](https://static-a1.steveyi.net/media/blog/2020060303492575.png)

Next, enter the Wi-Fi name to trigger.

![](https://static-a1.steveyi.net/media/blog/2020060314472031.jpg)

Then click "That", also select Android Device, and then select Turn off WiFi.

![](https://static-a1.steveyi.net/media/blog/2020060303512548.png)

After confirming that there is no error, please click Finish. The author recommends turning on the "Receive notifications when this runs" switch, so that IFTTT will remind you when Wi-Fi is turned off.

![](https://static-a1.steveyi.net/media/blog/2020060314480629.jpg)

If location information is required, please allow it, otherwise it will not work properly.

![](https://static-a1.steveyi.net/media/blog/IMG_20200603_120458.jpg)

Connected means it has been turned on.

![](https://static-a1.steveyi.net/media/blog/2020060314505188.jpg)

The effect is demonstrated below.

![](https://static-a1.steveyi.net/media/blog/2020060314511293.gif)

Every time Xiaomi, Redmi, Black Shark, and POCO phones run, they will pop up and ask for permission. We can choose permission management from the app details.

![](https://static-a1.steveyi.net/media/blog/2020060314583324.jpg)

Then find "Open WLAN" and set it to always allow.

![](https://static-a1.steveyi.net/media/blog/2020060314593226.jpg)

> Here we are done! If a notification pops up when setting up the Applet, you will have the effect shown in the figure below~

*   ![](https://static-a1.steveyi.net/media/blog/2020061614302349.jpg)
    

#### Why not use Location to create an Applet?

Because as long as any Applet uses the Location service, IFTTT will always access the location information, consume power, and many brands of phones will turn off the location function when entering power-saving mode, so it cannot work properly.

![](https://static-a1.steveyi.net/media/blog/2020060307230142.jpg)

As long as any Applet uses the Location service, IFTTT will always use the location information.
