---
title: 'Adding a New Administrator Account to a Mac When You Forget the Login Credentials'
author: "SteveYi"
date: Thu, 04 Jun 2020 05:54:21 +0000
draft: false
tags: ['Life Tips']
Author: 蘿蔔
---

I borrowed an iMac that I used until the holidays, and left it in a safe place before going home (I couldn't take it with me). When I returned after more than a month, I discovered that I had forgotten my password (which sounds unbelievable, but it's true; I couldn't remember my previous password no matter how hard I tried). Fortunately, I had already backed up my data before going home.

I could have reinstalled everything, but I was too busy with other things, so I found a method that was much faster than reinstalling and didn't require me to redownload any apps. Additionally, the old account could be deleted using the new account. 

(Note: Do not use this method on a computer that does not belong to you, unless you have the owner's permission. I am not responsible for any disputes that arise. If you want to ensure that your computer is not modified by macOS tools, set a [firmware password](https://support.apple.com/zh-tw/HT204455#turnon), but if you forget the password, you will need to seek assistance from Apple.)

First, shut down your computer and turn it back on. While the computer is booting, press ⌘ (command) + R to access the macOS tools. Then, open Terminal in the "Utilities" menu.

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405312140.png)

Once you're in Terminal, enter the following commands in order, pressing `return` after each line:

Mount the disk:

```
mount -uw /
```

Make the computer act as if it has not been through the setup wizard, so the next time it boots up, the setup wizard will appear:

```
rm /var/db/.AppleSetupDone
```

Immediately restart:

```
shutdown -r now
```

After restarting, you should see the setup wizard:

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405322859.png)

Next, you can set up your user account:

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405331074.png)

Once you're logged in, open System Preferences from the  menu:

![](https://static-a1.steveyi.net/media/blog/2020060405381524.png)

Then, open "Users & Groups":

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405402392.png)

Click on the lock icon, and enter the new username and password you just created:

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405435722.png)

Choose the user you want to delete from the menu, click the "-" button, choose how you want to handle the user's files, and click "Delete User" to remove the old user:

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405491836.png)
