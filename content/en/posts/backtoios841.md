---
title: 'Downgrade 32-bit iOS Devices to 8.4.1 without Computer and SHSH'
author: "SteveYi"
date: 2019-12-30T13:26:02+00:00
draft: false
tags: ["iOS"]
Author: 蘿蔔
---

![](https://static-a1.steveyi.net/media/blog/2020/04/9564cd1098c2183afddb9be15db99ddf781db6b1-770x439_c.jpeg)

> Sometimes there may be problems with Apple, causing various problems. If there are any errors, please try again another day.
> 
> Apple's vulnerabilities are not very stable. I tried three times in one day and couldn't use them. I succeeded once another day. This is a bit of luck.
> 
> If the iOS device is slow, downgrading will be smoother
> 
> (A5 devices are very noticeable, while A6 and A6X devices are not much different but still a bit faster)
> 
> Although there is still occasional LAG, it has improved a lot
> 
> For example, the transition animation will not be as jerky as before

*   **Applicable devices:**
*   iOS 9.0～10.3.3, jailbroken devices as listed below
*   Jailbreak tutorials are attached for each version
*   iPhone 4S
*   iPhone 5
*   iPod Touch 5
*   iPad 2
*   iPad 3
*   iPad 4
*   iPad Mini 1st generation
*   \[iPhone 5C is not applicable\]

\*I am not responsible for any problems that may occur\*

※In fact, I have been using it until now without any problems. I hope the above sentence is just a precaution.

\*Please make an iTunes backup first\*

\*If it fails halfway or you regret it, you can use DFU to return to the original version or try again\*

\*Please clear all content and settings before proceeding!\*

After talking so much, let's get started

——————Divider——————

*   (If already jailbroken, skip this paragraph)
*   Jailbreak methods summary \[From [Mr. Mad website](https://mrmad.com.tw)\]
*   [10.X～10.3.3](https://www.google.com/url?q=https://mrmad.com.tw/h3lix&sa=D&ust=1577715419051000)
*   [9.3.5](https://www.google.com/url?q=https://mrmad.com.tw/phoenix-jailbreakable&sa=D&ust=1577715419052000)
*   [9.1~9.3.4](https://www.google.com/url?q=https://mrmad.com.tw/tihmstar-jailbreakme-4-0&sa=D&ust=1577715419052000)
*   [9.0.X](https://www.google.com/url?q=https://mrmad.com.tw/ios9-0-9-1-teachingios9-perfect-jailbreak-jailbreak-assault-pangu-jailbreak-tool-gives-you-the-perfect-escape-update-version-v1-3-1&sa=D&ust=1577715419052000)
*   8.4.1 after downgrade at the bottom of the article

——————Divider——————

Here, we will use iPad 2 (original 9.3.5) as an example

If you have two-step verification for your Apple ID, it is recommended to [turn off two-step verification](https://www.google.com/url?q=https://support.apple.com/zh-tw/HT202664&sa=D&ust=1577715419053000) or [register a new one](https://www.google.com/url?q=https://appleid.apple.com/account%23!%26page%3Dcreate&sa=D&ust=1577715419053000), and remember your password, otherwise it will be troublesome to log in later!

Before downgrading, please turn off the screen lock password!!! Otherwise, it may cause the device to be unable to unlock after the downgrade.

1. After jailbreaking, use iFile or Filza File Manager to open the file at the following path

/System/Library/CoreServices/SystemVersion.plist

If you make a mistake when typing, it may cause system damage and require a reset!

Don't worry if you make a mistake. If you don't restart, you can correct and save it with peace of mind.

Change Product Version to 6.1.3

Change ProductBuildVersion to 10B329

![](https://static-a1.steveyi.net/media/blog/2020/04/backtoios841-2.jpg)

2. After modifying and saving, make sure the version number is correct before restarting.

![](https://static-a1.steveyi.net/media/blog/2020/04/backtoios841-1.jpg)

3. Restart. It takes some time to complete the progress bar after restarting. After booting, please reset the device. Set the wizard to be set randomly, as long as you can enter the main screen (do not restore any backups!), The reset location is

Settings->General->Reset->Erase All Content and Settings
---------------------

After resetting, check for updates in Settings. You will see an update to iOS 8.4.1 on the update page. Click and install it.

![](https://static-a1.steveyi.net/media/blog/2020/04/backtoios841-3.jpg)

![](https://static-a1.steveyi.net/media/blog/2020/04/backtoios841-4.jpg)

4. After the update is complete, please clear all content and settings again

Otherwise, even system APPs will crash (such as "Change Language" in "Settings")

The reset button is known to be available

![](https://static-a1.steveyi.net/media/blog/2020/04/backtoios841-5.jpg)

![](https://static-a1.steveyi.net/media/blog/2020/04/backtoios841-6.jpg)

5. If "Activation Lock" appears, you need to log in with the Apple ID password that was originally used on the device, and then complete the setup!

![](https://static-a1.steveyi.net/media/blog/2020/04/backtoios841-7.jpg)

![](https://static-a1.steveyi.net/media/blog/2020/04/backtoios841-8.jpg)

![](https://static-a1.steveyi.net/media/blog/2020/04/backtoios841-9.jpg)

The following picture is another successful fourth-generation iPad downgrade

![](https://static-a1.steveyi.net/media/blog/2020/04/backtoios841-10.jpg)

Supplemental links:

*   [8.4.1 jailbreak](https://www.google.com/url?q=https://mrmad.com.tw/etason&sa=D&ust=1577715419056000)
*   [Block OTA updates in the future with a description file](https://www.google.com/url?q=https://mrmad.com.tw/technique-close-hide-ota&sa=D&ust=1577715419056000) 

\[Recommended, otherwise you may upgrade again someday and have to do it again\]

After installing the description file

![](https://static-a1.steveyi.net/media/blog/2020/04/backtoios841-11.jpg)

backtoios841-11.jpg

Success!
