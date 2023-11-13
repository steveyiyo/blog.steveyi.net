---
title: 'Backup and Restore Windows 7 and above PCs'
author: "SteveYi"
date: Fri, 28 Aug 2020 09:09:08 +0000
draft: false
tags: ["Free Resources", "Life Tips"]
Author: 蘿蔔
---

Mac has a "Time Machine" that can easily backup the entire computer, and Windows also has a similar function! 

In simple terms, it will backup the entire computer, disk drive or folder (depending on the settings). The first backup will be a complete backup, so it will take longer. After the first backup, it will only backup the files that have been modified or created since the last backup to save space and time.

First, open the start menu, find "Windows System", and then open the control panel.

![](https://static-a1.steveyi.net/media/blog/2020082808195051.png)

Next, go to System and Security > Backup and Restore.

![](https://static-a1.steveyi.net/media/blog/2020082808211660.png)

Click "Set up backup" and follow the instructions to choose backup settings and schedule. Also, it is recommended not to use the same hard drive as the startup disk, in case the hard drive fails and the backup is useless.

Now you can start the backup.

![](https://static-a1.steveyi.net/media/blog/2020082808264658-scaled.jpg)

The next page will tell you how to restore!

After the backup is complete, the entire startup disk or folder may be backed up depending on the settings.

If you want to restore the entire startup disk, the author has not experimented with it, but you can refer to the [Microsoft official article](https://support.microsoft.com/zh-tw/help/2138292 "https://support.microsoft.com/zh-tw/help/2138292").

If you want to restore a single folder or disk partition, right-click on the disk partition, choose "Properties", and find "Previous Versions", then select the time point to be restored.

![](https://static-a1.steveyi.net/media/blog/2020082808590870-scaled.jpg)

If you choose to open an old file, you can see the files backed up before and use them. If you choose to restore, the entire disk partition or folder will be overwritten, and the author has not tried this. The following is the appearance after opening an old file.

![](https://static-a1.steveyi.net/media/blog/2020082809060089-scaled.jpg)

Now you don't have to worry about accidentally deleting files anymore! However, you still need to pay attention to the backup cycle. If the files are deleted before the weekly backup, they cannot be restored.
