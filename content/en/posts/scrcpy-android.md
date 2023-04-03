---
title: 'Using Scrcpy to Control Your Android Phone from Your Computer'
date: Tue, 19 May 2020 15:41:11 +0000
draft: false
tags: ['Android']
Author: 蘿蔔
---

Introduction: Due to a sudden breakdown of the screen of my phone, the liquid crystal display (LCD) would display but with no backlight, making it difficult to view the screen. However, I still needed to use the phone to transfer important data and test Android programs. Therefore, I had to figure out a way to operate it! (As I currently use an iPhone)

![](https://static-a1.steveyi.net/media/blog/2020051917331789.jpg)

_(Screen can only be vaguely seen under intense light)_

  

Requirements: PC or Mac, device equipped with Android 5.0 or higher

(Although the official website says Linux works too, I do not have a Linux computer to write a tutorial, so I recommend that you go to the [official tutorial](https://github.com/Genymobile/scrcpy) for reference.)

The Android device needs to turn on USB debugging
-------------------

*   Turn on the Android phone, find the place about the phone, and click on the version number or build number or MIUI version number  
    (Different phones have different methods, which are not listed here)

*   Keep clicking until it says "You are now a developer!", and then open the developer options

(The location of "developer options" on each phone is different. For example, Xiaomi is located in "Settings> More settings".)

![](https://static-a1.steveyi.net/media/blog/2020051915343656.jpg)

*   Next, please open the developer options and turn on the USB debugging (also known as USB debugging). If you are using a Xiaomi phone, please also turn on security settings. This requires you to insert the SIM card and connect to the network (MIUI requirement)  
      
    It is recommended to turn on USB installation, as Scrcpy's drag-and-drop installation function is quite handy ([see this article](http://blog.steveyi.net/scrcpy-android-apk))

![](https://static-a1.steveyi.net/media/blog/2020051915351328.jpg)

![](https://static-a1.steveyi.net/media/blog/2020052609195565.jpg)

*   Please click "Next" all the way through the "Security Settings" pop-up window, and remember to insert the SIM card  
    (Otherwise, a prompt to insert the card will appear later on)
*   If you encounter an unfamiliar computer, remember to press "Allow debugging" on the phone
*   Next, proceed to install the environment on your computer

PC environment installation
------

*   Please download the latest [toolkit](https://github.com/Genymobile/scrcpy#windows) and unzip it (I prefer to unzip it to the C drive directory)  
    You can also install it with the ADB driver installation file and carry it with you on a USB drive.

[![](https://static-a1.steveyi.net/media/blog/2020051915360349.png)](https://github.com/Genymobile/scrcpy#windows)

![](https://static-a1.steveyi.net/media/blog/2020051915362241.png)

*   Go to [adb.clockworkmod.com](https://adb.clockworkmod.com/) and click the white Download button to install the ADB driver.

(If you have installed the ADB driver before, please skip this part.)

*   Click "Next" in the lower right corner all the way through. The default option is enough for us to use.

![](https://static-a1.steveyi.net/media/blog/2020051915363719.png)

*   If it asks for permission, click "Yes"

![](https://static-a1.steveyi.net/media/blog/2020051915371217.png)

*   After installation, click "Close"

![](https://static-a1.steveyi.net/media/blog/2020051915371930.png)

*   Open the folder where Scrcpy is located, find scrcpy-noconsole.exe and double-click it to run it, then you can operate it  
    

![](https://static-a1.steveyi.net/media/blog/2020052000172131.png)

![](https://static-a1.steveyi.net/media/blog/2020052000290950.png)

*   **Control method**
    *   Main operation: Left-click the mouse>click. Middle-click the mouse>return to the main screen. Right-click the mouse>back

Other function shortcuts↓

Action

Shortcut

Full screen mode

Ctrl+f

Adjust window to 1:1 ratio

Ctrl+g

Adjust the window to remove black edges

Ctrl+x

Main screen

Ctrl+h 

Back

Ctrl+b

Multi-tasking

Ctrl+s

Menu key

Ctrl+m

Volume up

Ctrl+↑

Volume down

Ctrl+↓ 

Power key

Ctrl+p

Brighten the screen

Right-click the mouse when the screen is locked

Install apk files from the computer

Drag and drop the APK file

Mac environment installation
-------

*   Please install Homebrew first. If you have already installed it, skip this step.
    *   Open Terminal (a built-in tool program in the system)
    *   Enter  
        `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
    *   Follow the instructions to proceed
*   Install Scrcpy and its driver through Homebrew
    *   After completion, enter  
        `brew cask install android-platform-tools`
    *   After completion, enter  
        `brew install scrcpy`
*   When you need to use it, open Terminal and enter `scrcpy` to start using it.  
    The Terminal window can be minimized, leaving the operating screen open doesn't matter.

![](https://static-a1.steveyi.net/media/blog/2020051915380923.png)

*   **Control method**

Main operation: Left-click the mouse>click. Middle-click the mouse>return to the main screen. Right-click the mouse>back

Other function shortcuts↓

Action

Shortcut

Full screen mode

Command+f

Adjust window to 1:1 ratio

Command+g

Adjust the window to remove black edges

Command+x

Main screen

Command+h 

Back

Command+b

Multi-tasking

Command+s

Menu key

Command+m

Volume up

Command+↑

Volume down

Command+↓ 

Power key

Command+p

Brighten the screen

Right-click the mouse when the screen is locked

Install apk files from the computer

Drag and drop the APK file

Usage result
----

![](https://static-a1.steveyi.net/media/blog/2020051916163290.jpeg)