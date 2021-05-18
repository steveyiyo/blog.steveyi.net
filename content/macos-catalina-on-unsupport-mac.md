---
title: '在官方不支援macOS Catalina的裝置安裝macOS Catalina'
date: Tue, 18 Aug 2020 10:41:18 +0000
draft: false
tags: ['免費資源', '生活小知識']
Author: 蘿蔔
---

有些電腦明明還可以好好的、正常使用，但可能因為官方的多重考量(不管是效能上、商業上、或是功能上之類的考量)，而被官方從升級名單中一代一代的移除，豈不是覺得很可惜嗎

這時候，有一位[dosdude1](http://dosdude1.com)做了[Catalina Patcher](http://dosdude1.com/catalina "dosdude1.com/catalina")解決了這個問題。

  
這是官方的支援名單:

![](https://static.yiy.tw/media/blog/2020081801505962.png)

螢幕快照擷取自[Apple官網](http://apple.com/tw/osx)

下方這是Catalina Patcher的支援名單，與OS X El Captain系統要求一致:

[![](https://static.yiy.tw/media/blog/2020081802051786.png)](https://support.apple.com/zh-tw/HT206886)

螢幕快照擷取自[Apple官網](https://support.apple.com/zh-tw/HT206886)

本篇教學以MacBook Air 2011作為示範，與其他機型操作步驟差不多。  

> 注意:  
> \-如果電腦支援[官方High Sierra](https://support.apple.com/zh-tw/HT208969)的話，請先[升級High Sierra](https://support.apple.com/zh-tw/HT208969)再操作此篇。  
> \-畢竟Catalina Patcher不是Apple官方所調整釋出的，難免會有一些已知或未知的bug，可以接受的話再進行操作。  
> \-Catalina Patcher已知問題:如果電腦搭配AMD Radeon 5000系列或6000系列的顯示卡，顯示卡無法使用硬體加速，操作起來就卡卡的，毛玻璃效果會被停用，比較華麗的動態效果也會很卡頓，也不能執行一些需要硬體加速的程式，像是iMovie之類的

操作步驟：

請先前往[Catalina Patcher的網站](http://dosdude1.com/catalina)按下Download Latest Version並下載最新版

![](https://static.yiy.tw/media/blog/2020081802335586.png)

下載完成後打開映像檔會看到一個App，將它點開。  
然後進到「系統偏好設定」內的「安全性與隱私權」強制打開

![](https://static.yiy.tw/media/blog/2020081802485327.png)

然後按下白色的「打開」按鈕

![](https://static.yiy.tw/media/blog/2020081802492691.png)

然後請一路按下Continue，需要時請輸入密碼允許進行更動

![](https://static.yiy.tw/media/blog/2020081802523595.png)

請按下右邊的「Download a copy」藍色按鈕

![](https://static.yiy.tw/media/blog/2020081802533817.png)

然後按下「Start Download」

![](https://static.yiy.tw/media/blog/2020081802550610.png)

下載完成後可以選擇直接安裝(左)、製作可開機安裝程式的隨身碟(中)，或是製作ISO映像檔(右)

![](https://static.yiy.tw/media/blog/2020081803333085.png)

選擇Install to This Machine的話是直接安裝到機器上，要關閉SIP安全保護，這個筆者沒試過。  
選擇Create a Bootable Installer就是製作可開機安裝程式的隨身碟。  
選擇Create an ISO image是製作映像檔可供燒錄DVD使用。

筆者以Create a Bootable Installer作為本篇文章的示範  
按下Create a Bootable Installer之後可以選擇要安裝到哪裡，完成後按下Start再按Yes，然後再輸入密碼就會開始清除隨身碟上的資料並製作可開機安裝程式隨身碟了

完成以後重新啟動時按住option會看到macOS Base System，按下去會開機到macOS Catalina的macOS工具程式。

![](https://static.yiy.tw/media/blog/2020081810082548-scaled.jpg)

接下來請按下「重新安裝macOS」

![](https://static.yiy.tw/media/blog/2020081810100644-scaled.jpg)

進入安裝程式後請按下「繼續」，並同意條款。

![](https://static.yiy.tw/media/blog/2020081810111093-scaled.jpg)

接下來選擇要安裝在哪個磁碟或卷宗

![](https://static.yiy.tw/media/blog/2020081810121883-scaled.jpg)

接下來可能升級完成後會開機，如果進度條卡住而且沒有寫安裝剩餘時間可以試著強制關機(隨身碟還不用拔掉)，然後再次開機同時按option選擇macOS Base System來開機

![](https://static.yiy.tw/media/blog/2020081810082548-scaled.jpg)

然後這次一樣回到macOS工具程式，這次選擇「macOS Post Install」才能解決驅動程式等問題

![](https://static.yiy.tw/media/blog/2020081810100644-scaled.jpg)

接下來會依照所使用的機型進行安裝，不用手動更改選項，直接按下面的「Apply Patches」即可

![](https://upload.cc/i1/2020/08/18/mbULt6.jpeg)

完成後會重新啟動電腦，並且會出現歡迎畫面  
接下來如果有需要還原時光機備份或是從其他電腦轉移資料也可以在這裡完成，或是設定完成後打開「系統移轉輔助程式」

![](https://static.yiy.tw/media/blog/2020081810265417.png)

接下來將它設定好就可以正常使用囉

![](https://static.yiy.tw/media/blog/2020081810311541.png)