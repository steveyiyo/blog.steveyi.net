---
title: 'A Discussion on the Impact of Battery and Performance on Mac Laptops'
date: Tue, 18 Aug 2020 13:16:25 +0000
draft: false
tags: ['Life Tips']
Author: 蘿蔔
---

As someone who has used PCs since childhood, I only started using a MacBook Pro a few years ago when my family bought one (well, it's not mine, I just borrow it for a long time 😂).

The first laptop I owned was an IBM ThinkPad T43. When I got it, the battery was so old that it was almost useless (it lasted about 3 minutes and 42 seconds from boot to hibernation), so most of the time I removed the battery to reduce the weight, and only installed it when I needed to move between power outlets. On this laptop and the several PC laptops I used afterwards, removing the battery and using the laptop only with the power cord did not result in any noticeable throttling. However, the PC laptops I later bought had specifications that were too low and after a few years, they couldn't keep up with the speed at which software was becoming larger and more resource-intensive. They often crashed, and even crashed several times while I was saving presentations, resulting in data loss. So, I started borrowing my family's MacBook Pro.

It wasn't until my family's 2017 MacBook Pro had keyboard problems and needed to be sent for repair that I borrowed a MacBook Air 2011 that had been unused and had a battery that couldn't be charged. I thought it was just that the laptop couldn't be used without the power cord, but after booting it up, it was very slow and didn't perform as it should have with a 2nd generation 1.6GHz Intel Core i5 processor. After seeing warnings all over the place that the battery needed to be repaired, I suspected that the slow performance was due to the low battery efficiency and the system's throttling, similar to the [performance management on iPhones](https://support.apple.com/en-us/HT208387).

![](https://static-a1.steveyi.net/media/blog/2020081811411362.png)

I used [intel(R) Power Gadget](https://software.intel.com/sites/default/files/managed/91/6b/Intel%20Power%20Gadget.dmg) to check, and as I expected, the frequency was locked at the highest (Core MAX) 0.9GHz.

![](https://static-a1.steveyi.net/media/blog/2020081813104832.jpg)

Later, I found Apple's explanation about throttling on computers without batteries on the Internet (the original webpage has since disappeared):

> If the battery is removed from a MacBook or MacBook Pro, the computer will automatically reduce the processor speed (to 1Ghz).  
> This prevents the computer from shutting down if it demands more power than the A/C adaptor alone can provide.  
> Additional information:  
> Important: It is strongly recommended that you do not use your MacBook or MacBook Pro while the battery is removed. Accidently bumping the A/C adaptor could disconnect power and shutdown the computer. Any information that was not saved on your computer would be lost.  
> 
> Chinese Translation:  
> 如果电池从MacBook或是MacBook Pro移除，电脑会自动降低处理器频率(到1GHz)。  
> 这防止电脑所需的电源超出电源供应器的负荷。额外资讯：  
> 重要：强烈建议您不要在MacBook或是MacBook Pro移除电池时使用。意外扯到电源供应器会让电脑断电并关机。任何未储存在电脑里的资讯都会遗失。

So it seems that a battery that needs repair is equivalent to not having a battery at all for the system.

How can we check the battery status?
---------------

We can open the "" (Apple menu), hold down the option key and click on "System Information", then select "Power" in the menu to find all the information about the battery. The number of cycles is a very important indicator. For information on cycles, please refer to [Apple's website](https://support.apple.com/en-us/HT201585). 

If the status is not marked as "normal", then I think it's best to have it repaired. After all, if your computer shuts down due to a bad battery, not only will unsaved files be lost, but the hard drive may also be damaged due to abnormal power outages. In addition, even if the sleep mode is set to Deep Sleep, a non-charging battery still requires power during sleep, and the state of sleep cache will be lost when the power is removed.

![](https://static-a1.steveyi.net/media/blog/2020081812235896.png)

In conclusion,
-----------

PCs are generally not affected if the battery is removed, while Macs without a battery or with a battery that the system considers in need of repair will seriously affect the user experience.

If you see a Mac laptop on a online auction website that says "battery has been removed", and you think you can get a bargain without a battery, please consider the cost of replacing the battery before purchasing it! Unless you can accept the slow operating speed and user experience of a laptop running at this low frequency.

Update on 8/21:
After testing, I found that using an older version of OS X can get better performance even if the CPU is throttled. So, during the waiting period for battery replacement (or if you don't want to replace the battery at all), you can try an older version of OS X. I used OS X 10.9.5 "Mavericks" as my primary operating system during the waiting period, but the application compatibility of older versions of OS X is poorer, so please use your own discretion.

![](https://static-a1.steveyi.net/media/blog/2020082115435852.png)