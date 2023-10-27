---
title: "Cisco N3K-C3048TP-1GE Upgrade from 6.x to 9.x Full Process"
author: "SteveYi"
date: 2023-02-06T01:51:10+08:00
draft: false
---

Recently, I had a N3K-C3048TP-1GE switch with an outdated version causing some issues, so I decided to upgrade to a new version to solve these problems!

Major version upgrades have certain risks, so please read this article and the [official document](https://www.cisco.com/c/en/us/support/docs/switches/nexus-3048-switch/216023-nexus-3048-nx-os-software-upgrade-proced.html) before deciding whether to proceed!

## Environment Before Upgrading

Model: N3K-C3048TP-1GE-SUP  
NXOS: 6.0(2)U3(4)

> Important reminder:  
> Please follow the guide to upgrade this switch and do not upgrade to the latest version at once!  
> Otherwise, your device may become bricked and unusable!

Reference documents:
- [Cisco Nexus 3048TP Bricked](https://community.cisco.com/t5/switches-small-business/cisco-nexus-3048tp-bricked/td-p/3182064)
- [Upgrade Nexus 3048 NX-OS Software](https://www.cisco.com/c/en/us/support/docs/switches/nexus-3048-switch/216023-nexus-3048-nx-os-software-upgrade-proced.html)

## Upgrade Path

1. 6.0(2)U3(4) <-- Initial version
2. 6.0(2)U6(3a)
3. 7.0(3)I7(6)
4. 9.3(3)

## Upgrade from 6.0(2)U3(4) to 6.0(2)U6(3a)

First, obtain the corresponding bin files.

- n3000-uk9-kickstart.6.0.2.U6.3a.bin
- n3000-uk9.6.0.2.U6.3a.bin

> It is noteworthy that in this version, kickstart and nxos are separated.

After obtaining the files, enter the following command to install the new version. Please modify the corresponding directory and file name yourself.

```shell
install all kickstart bootflash:n3000-uk9-kickstart.6.0.2.U6.3a.bin system bootflash:n3000-uk9.6.0.2.U6.3a.bin
```

![](https://i.imgur.com/5NnAvVL.jpg)

When all verifications are completed, please enter `y` to install the new version to the system.  
The switch will automatically restart after the installation is completed.

![](https://i.imgur.com/jjaGYT9.png)

After restarting, enter `show module` to see if the upgrade was successful!

![](https://i.imgur.com/3stlea5.jpg)

## Upgrade from 6.0(2)U6(3a) to 7.0(3)I7(6)

Here, we use `nxos.7.0.3.I7.6.bin` as the upgrade file.

Enter the following command directly to start the upgrade. Please modify the corresponding directory and file name yourself.

```shell
install all nxos bootflash:nxos.7.0.3.I7.6.bin`
```

After the upgrade is completed, enter `show module` again to see if the upgrade was successful!

![](https://i.imgur.com/XVEwapW.jpg)

## Upgrade from 7.0(3)I7(6) to 9.3(3)

Finally, we come to the last step! If your NX-OS version is 7.x, you can upgrade directly to 9.x!

Here, I used a compacted file that has already been prepared. Since the system disk space is insufficient, I first stored the file on a USB and deleted the log.

***
When installing the new version, the .bin file will still be copied to the system.
So if the system space is still insufficient, the upgrade may fail!
***

- nxos.9.3.3.compact.bin

Use the following command to upgrade. Please modify the corresponding directory and file name yourself.

```shell
install all nxos usb1:nxos.9.3.3.compact.bin
```

After verification, remember to enter `y` to install the new version into the system!

![](https://i.imgur.com/7Po780T.png)

After the final restart, enter `show module` to verify if the update was successful~

![](https://i.imgur.com/pcDihVj.jpg)

## Conclusion

Major version installations are really cumbersome and dangerous!  

I strongly recommend connecting to the console during the upgrade to prevent network disconnection from causing you to not know the latest situation. Also, it may cause your configuration file to be lost, so please back up your current configuration file before upgrading.

Finally, thank you very much to akw and Licson for their assistance during the upgrade process!

![](https://i.imgur.com/HmZXnnD.png)
