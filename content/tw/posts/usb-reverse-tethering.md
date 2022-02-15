---
title: '透過電腦使用USB傳送網際網路連線給手機 (USB Reverse Tethering)'
date: Tue, 07 Apr 2020 04:57:33 +0000
draft: false
tags: ['Android']
Author: 蘿蔔
---

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-.png)

本篇教學使用搭載Android 5.0.2，Wi-Fi和藍芽損壞的手機搭配Windows 10做示範。

請注意:不一定保證每一隻手機都相容，就算相容還是有一些App不認得此類型連接方式 (它們通常只認得行動數據和Wi-Fi連接)

本篇著重於使用Windows平台進行的部分，所以不討論其他作業系統，其他作業系統理應當也是差不多才對。請讓電腦先安裝手機的驅動程式

(外部連結: [https://mobileai.net/2016/09/22/google-adb-driver/](https://mobileai.net/2016/09/22/google-adb-driver/) )

HTC Sense 6或更早版本的Sense，有內建此功能而無須操作以下教學

(設定>更多>可攜式熱點和數據連線>USB網路設定>透過電腦傳送)

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-1.png)

首先請先到GitHub下載Gnirehtet

[https://github.com/Genymobile/gnirehtet#rust](https://github.com/Genymobile/gnirehtet#rust)

找到Windows後按下下載之後解壓縮

[![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-2.png)](https://github.com/Genymobile/gnirehtet#rust)

解壓縮後會得到三個檔案

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-3.png)

請將gnirehtet.apk安裝到手機上(安裝完在桌面找不到是正常的)

不清楚apk怎麼安裝的話網路上有很多教學可以參考，在這裡先不贅述

接下來請在手機上開啟開發人員選項

不同品牌手機有不同開啟方法

以HTC手機為例，打開設定>關於手機>軟體版本>更多，接著狂戳"建置號碼"

直到跳出Toast訊息"不需要了，您已經是開發人員"

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-4.png)

完成後請點擊"開發人員選項"

之後勾選USB偵錯並確認

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-5.png)

如果詢問是否允許，請允許，如果懶得每次都按允許的話，可以勾選"永遠允許從此電腦進行"

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-6.png)

然後請將手機設定密碼(設定>安全性>螢幕鎖定方式>選擇圖形，PIN碼或密碼)

否則有些情況下無法上網

如果任何步驟執行時跳出新增VPN連線的請求，請按下允許

接下來請將手機連接到電腦，並點擊電腦上的gnirehtet-run.cmd

如果執行時跳出新增VPN連線的請求，請按下確定

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-7.png)

接下來會看到電腦有字很多字在跑，關掉這個視窗等同斷線，所以沒有要看它的連線紀錄的話請最小化

(按右上角的 - )就好

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-8.png)

接下來手機就可以上網囉

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-9.png)

Spotify串流音樂也是可以的

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-10.png)

如果需要斷線，可以在通知點選"Stop Gnirehtet”

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-11.png)

注意:有一些網路環境(如校園網路或工作場域網路等)可能會因某些考量而封鎖相關連線，所以可能會造成無法上網(如下圖)，此時換成別的網路就行囉

![](https://static-a1.steveyi.net/media/blog/2020/04/usb-reverse-tethering-12.png)

免責聲明:

如果有因本教學造成任何爭議，本作者一蓋不負責

對於非本作者創作之相關資訊，或是非本作者控制或測試之獨立網站，不得解釋本作者為其推薦或背書。

![](https://static-a1.steveyi.net/media/blog/2020/04/cc.png)

© iambjlu