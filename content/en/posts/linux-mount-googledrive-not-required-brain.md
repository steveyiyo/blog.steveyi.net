---
title: 'Easy integration with Google Drive in Linux environment'
author: "SteveYi"
date: 2021-01-19T12:25:49+0000
draft: false
tags: ["Google", "Free Resources", "Life Hacks", "Internet"]
Author: 蘿蔔
---
This tutorial uses the software google-drive-ocamlfuse and the demonstration is based on the Ubuntu-based Zorin OS 15.2 system.

First, you need to add the software source. Please enter the following command in the terminal (you can directly copy and paste this command):

sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse
Note: The installation process may require a password. Some Linux distributions may not display the entered password. After typing, press Return to continue.

After the installation is complete, please enter this command in the terminal to start the mounted program:

google-drive-ocamlfuse
The first time you run it, a browser window will pop up for the user to log in and select an account. When permission is requested, please select Agree.
After successful login, you will see this page (as shown below), and see this message in the terminal:

Access token retrieved correctly.

![](https://static-a1.steveyi.net/media/blog/2021011913110433.png)

Next, please enter this command to create a mounted folder in the Home Directory:

mkdir ~/GoogleDrive
Then, enter this command to complete the mount!

google-drive-ocamlfuse ~/GoogleDrive

![](https://static-a1.steveyi.net/media/blog/2021011913111963.png)

The mounted location will be in the Google Drive folder under the Home Directory.

![](https://static-a1.steveyi.net/media/blog/2021011913113183.png)

If you want to unmount, you can use the following command in the terminal:

fusermount -u ~/GoogleDrive
If you want to check more commands, you can enter this command in the terminal for more help:

google-drive-ocamlfuse --help
