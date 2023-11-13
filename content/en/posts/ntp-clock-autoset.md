---
title: 'Automatically Correct Time on Windows 10 After Turning on Computer (Wake Up)'
author: "SteveYi"
date: Fri, 20 Nov 2020 15:52:24 +0000
draft: false
tags: ["Free Resources", "Life Tips"]
Author: 蘿蔔
---

The clock is a very important thing for computers. It is not just about displaying the time in the status bar (or taskbar). If the clock is not correct (deviates too much from the actual time in the real world), it may cause some strange phenomena on the computer, such as: unable to view web pages (certificate issues), and even cause software crashes if the time difference is too great. Timeout login of various programs is also easy to occur when the time deviation is too large.

![](https://static-a1.steveyi.net/media/blog/2020112014495468.png)

Certificate issues caused by time errors resulting in inability to browse web pages

![](https://static-a1.steveyi.net/media/blog/2020112015550593.png)

Timeout login of various programs, including iTunes

Speaking of this, everyone should think of the system's built-in automatic time correction function.

![](https://static-a1.steveyi.net/media/blog/2020112014523058.png)

The system's correction function, the author has never seen it automatically correct the time for me, every time I have to press [Update Now] to correct the time for me (it will not be timed every time the computer is turned on. It is said that it takes several days to correct it once).

Unfortunately, the author's dual-A brand PC (notebook) and the previous PC desktop (CMOS dead), whether or not it is plugged in, as long as Windows is not operating (sleep, hibernation, shutdown, crash), the clock will stop calculating time, every time you turn on the computer, you will see the date of the last time the computer was turned off (or reset), and you have to manually adjust it after opening it, which is really troublesome. Therefore, I studied the automatic time correction function of the clock and corrected it every time the computer was turned on.

The application used here is [NTPClock](https://www.stdtime.gov.tw/chinese/exe/NTPClock.exe "https://www.stdtime.gov.tw/chinese/exe/NTPClock.exe") launched by the National Time and Frequency Standards Laboratory.
Although it is a bit old, its function is still normal.

NTPClock installation tutorial
---------------

First, please click here to download [NTPClock](https://www.stdtime.gov.tw/chinese/exe/NTPClock.exe "https://www.stdtime.gov.tw/chinese/exe/NTPClock.exe"). After downloading, please do not rush to open it.
Please move the program to the "C:\NTPClock" folder (create the folder yourself), and then right-click on the program, select [Compatibility], and then change the parameters circled in the picture in turn before opening it.

![](https://static-a1.steveyi.net/media/blog/2020112015050958.png)

Please allow permission when opening, otherwise the time cannot be changed.

![](https://static-a1.steveyi.net/media/blog/2020112015075546.png)

Next, the program will be minimized in the system tray, and the icon can be right-clicked to exit.

![](https://static-a1.steveyi.net/media/blog/2020112015113959.png)

Set to automatically use NTPClock to correct time when starting up
--------------------

If the picture is too small, you can right-click to open it in a new tab.

According to NTPClock's default settings, the system time will be corrected every time the program is opened.
Therefore, we need to use the "Task Scheduler" to set up the program to automatically start NTPClock with "administrator privileges" every time the computer is unlocked.

First, please find "Task Scheduler" in Windows search.

![](https://static-a1.steveyi.net/media/blog/2020112015162761.png)

![](https://static-a1.steveyi.net/media/blog/2020112015362266.png)

Next, please go to the trigger program, and adjust the settings circled in red in the figure below.

![](https://static-a1.steveyi.net/media/blog/2020112015253737.png)

Go to the action location, and adjust the settings circled in red in the figure below.

![](https://static-a1.steveyi.net/media/blog/2020112015265857.png)

Go to the condition location, and adjust the settings circled in red in the figure below.

Correct the picture error: uncheck "Start the task only if the computer is on AC power"

![](https://static-a1.steveyi.net/media/blog/2020112015284487.png)

Go to the settings location, and adjust the settings circled in red in the figure below.

![](https://static-a1.steveyi.net/media/blog/2020112015293652.png)

Next, set to turn off NTPClock when locking, logging out, or shutting down (sleep, hibernate, shut down) the computer
(otherwise, if it is not shut down or logged out, every time you turn on the computer, another NTPClock will be opened, and after opening the computer a few more times, the taskbar will be full).

![](https://static-a1.steveyi.net/media/blog/2020112015394495.png)

Next, please go to the trigger program, and adjust the settings circled in red in the figure below.

![](https://static-a1.steveyi.net/media/blog/2020112015422241.png)

Go to the action location, and adjust the settings circled in red in the figure below.

![](https://static-a1.steveyi.net/media/blog/2020112015435684.png)

Go to the condition location, and adjust the settings circled in red in the figure below.

Correct the picture error: uncheck "Start the task only if the computer is on AC power"

![](https://static-a1.steveyi.net/media/blog/2020112015284487.png)

Go to the settings location, and adjust the settings circled in red in the figure below.

![](https://static-a1.steveyi.net/media/blog/2020112015293652.png)

Now, every time you turn on the computer, it will automatically correct the time~ If the time will run off when the computer is turned off, you don't need to manually adjust the time every time you turn on the computer in the future!
