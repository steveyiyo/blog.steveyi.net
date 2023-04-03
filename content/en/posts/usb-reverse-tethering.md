# Using USB to Send Internet Connection from Computer to Phone (USB Reverse Tethering)

This tutorial demonstrates using a phone with Android 5.0.2 and damaged Wi-Fi and Bluetooth features, paired with Windows 10.

Please note: It's not guaranteed that every phone is compatible, and even if it is, some apps may not recognize this type of connection (they usually only recognize mobile data and Wi-Fi connections).

This article focuses on the Windows platform, so other operating systems will not be discussed, but they should be similar. Please install the phone's driver on the computer first.

(External link: [https://mobileai.net/2016/09/22/google-adb-driver/](https://mobileai.net/2016/09/22/google-adb-driver/))

For HTC Sense 6 or earlier versions of Sense, this feature is built-in and does not require following the tutorial.

(Settings>More>Portable Hotspot and Data Connection>USB Network Settings>Send via Computer)

First, please download Gnirehtet from GitHub.

[https://github.com/Genymobile/gnirehtet#rust](https://github.com/Genymobile/gnirehtet#rust)

Find Windows and click download, then extract after downloading.

[![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-2.png)](https://github.com/Genymobile/gnirehtet#rust)

After extracting, you will get three files.

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-3.png)

Please install gnirehtet.apk on the phone (it is normal if it cannot be found on the desktop after installation).

If you're unsure how to install apk, there are many tutorials on the internet to refer to, but we won't go into detail here.

Next, please open the developer options on the phone.

Different brands of phones have different methods for opening them.

Taking HTC phones as an example, open Settings>About Phone>Software Version>More, and then click "Build Number" repeatedly until a Toast message appears saying "No need, you're already a developer".

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-4.png)

After completion, please click "Developer Options".

Then check USB debugging and confirm.

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-5.png)

If asked for permission, please allow it. If you're too lazy to allow it every time, you can check "Always allow from this computer".

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-6.png)

Then please set a password on the phone (Settings>Security>Screen Lock Method>Select Pattern, PIN Code, or Password).

Otherwise, in some cases, you may not be able to access the Internet.

If a request to add a VPN connection appears during any of the steps, please allow it.

Next, please connect the phone to the computer, and click gnirehtet-run.cmd on the computer.

If a request to add a VPN connection appears during execution, please click OK.

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-7.png)

Next, you will see a lot of text running on the computer. If you don't need to see the connection log, please minimize the window (click the - in the upper right corner).

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-8.png)

Next, the phone can access the Internet.

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-9.png)

Spotify streaming music is also possible.

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-10.png)

If you need to disconnect, you can click "Stop Gnirehtet" in the notification area.

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-11.png)

Note: Some network environments (such as campus networks or workplace networks, etc.) may block related connections for certain considerations, so you may not be able to access the Internet (as shown below). In this case, just switch to another network.

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-12.png)

Disclaimer:

If there are any disputes caused by this tutorial, the author is not responsible.

For information not created by the author, or independent websites not controlled or tested by the author, the author shall not be interpreted as recommending or endorsing them.

![](https://static-a1.steveyi.net/media/blog/2020/04/cc.png)

© iambjlu