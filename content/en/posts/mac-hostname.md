---
title: 'Changing Mac Hostname from Terminal'
author: "SteveYi"
date: Sat, 22 Aug 2020 08:25:56 +0000
draft: false
tags: ['Life Tips']
Author: 蘿蔔
---

When we open the terminal, we will see a string of characters that says "username@hostname", for example, John@Johns-MacBook.

The hostname can theoretically be changed from the "Sharing" section in System Preferences. However, for some reason, it may not work on some computers. After searching for a few days, I finally found the answer: we can change the hostname from the terminal.

First, please open the terminal and enter the following command. Note: please replace "MacHostName" with the desired hostname. The hostname can only contain alphanumeric characters and hyphens (-), and should not be too long.

```
sudo scutil --set HostName MacHostName
```

Next, please enter your password (you may not see it) and press return.

Finally, close and reopen the terminal to see the new hostname!

![](https://static-a1.steveyi.net/media/blog/2020082208224152.png)
