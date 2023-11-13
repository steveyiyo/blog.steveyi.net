---
title: '使用CloudReady體驗ChromiumOS作業系統，老電腦重獲新生!'
date: Mon, 10 Aug 2020 15:10:52 +0000
draft: false
tags: ["Google", "免費資源", "生活小知識"]
Author: 蘿蔔
categories: "科技"
---

不曉得各位有沒有一種經驗，電腦老舊了，連文書處理和基本的瀏覽網頁都卡頓，但又不想使用太老舊的作業系統(官方停止提供新功能了，連瀏覽器也不提供更新支援了)，這時便可以下載最新版的CloudReady家用版來使用囉!既有最新版的瀏覽器，也有不少Web App能使用；也因為是基於瀏覽器的作業系統，因此資源占用比許多作業系統都少，也不用怕不習慣使用Linux作業系統(安裝軟體的方式很不一樣，使用邏輯也差很多，而且一直使用命令行也不是很直覺的用法)，所以，只要電腦支援64位元，幾乎都可以用CloudReady(試過家裡唯一一台32位元電腦，無法使用32位元版的CloudReady開機)

開始吧!

準備材料有:

1.  8GB隨身碟(資料會洗掉，請先移除資料)
2.  要安裝的電腦

首先請先到[官網](https://www.neverware.com/freedownload#home-edition-install "https://www.neverware.com/freedownload#home-edition-install")按下\[DOWNLOAD 64-BIT IMAGE\]下載64位元版安裝檔[(32位元版已停止支援)](https://www.neverware.com/blogcontent/2019/7/12/announcement-end-of-support-for-cloudready-home-edition-32bit "https://www.neverware.com/blogcontent/2019/7/12/announcement-end-of-support-for-cloudready-home-edition-32bit")  
無論使用何種系統，請不要選擇USB Maker，因為筆者和朋友測試多次，很容易製作失敗

![](https://static-a1.steveyi.net/media/blog/2020081014045049.png)

請將下載後的檔案(\*.zip)解壓縮後會得到一個(\*.bin)檔案

![](https://static-a1.steveyi.net/media/blog/2020081014081737.png)

接下來請使用Chrome開啟[這個連結](https://chrome.google.com/webstore/detail/chromebook-recovery-utili/jndclpdbaamdhonoechobihbbiimdgai?utm_source=chrome-app-launcher-info-dialog "https://chrome.google.com/webstore/detail/chromebook-recovery-utili/jndclpdbaamdhonoechobihbbiimdgai?utm_source=chrome-app-launcher-info-dialog")，並安裝後開啟

插上隨身碟之後按齒輪，並按下\[Use local image\]

![](https://static-a1.steveyi.net/media/blog/2020081014111649.png)

選擇剛剛解壓縮出來的BIN(\*.bin)檔案

![](https://static-a1.steveyi.net/media/blog/2020081014135411.png)

然後插入並選擇剛剛準備好的隨身碟

![](https://static-a1.steveyi.net/media/blog/2020081014150721.png)

接下來按兩次藍色按鈕，並授予使用者帳戶控制的權限，等待完成

![](https://static-a1.steveyi.net/media/blog/2020081014165917.png)

如果過程中跳出USB磁碟機需要格式化的視窗，請按下取消!

![](https://static-a1.steveyi.net/media/blog/2020081014261042.png)

完成之後請將電腦關機，依照電腦製造商提供的方法進入BIOS設定、開機選單或Mac開機管理程式，並選擇使用剛剛製作好的隨身碟開機(視情況可能需要輸入BIOS密碼或是[韌體密碼](https://support.apple.com/zh-tw/guide/mac-help/mchl126463db/mac "https://support.apple.com/zh-tw/guide/mac-help/mchl126463db/mac"))  
  
本篇以PC作為示範，所以使用Boot Menu選擇USB磁碟機(隨身碟名字可能不一樣)

![](https://static-a1.steveyi.net/media/blog/2020081014475160-scaled.jpg)

再來會進入開機畫面

![](https://static-a1.steveyi.net/media/blog/2020081014493026-scaled.jpg)

開機完成後可以選擇語言和聯網等基礎設定

![](https://static-a1.steveyi.net/media/blog/2020081014502140-scaled.jpg)

![](https://static-a1.steveyi.net/media/blog/2020081014503063.jpg)

設定完成後可以按下藍色的開始使用

![](https://static-a1.steveyi.net/media/blog/2020081014521448.png)

右下角按下後會展開控制中心（下半部）和通知中心（上半部）  
控制中心可以控制各式開關、關機、鎖定、打開系統偏好設定  
按下Install OS便可以安裝到硬碟，以後開機就不用依賴這個隨身碟了，但是會將硬碟資料清空，請謹慎操作。

![](https://static-a1.steveyi.net/media/blog/2020081014532111.png)

左下角的圓形按鈕是啟動台，可以找Chromium應用程式商店下載各式Chrome App和擴充功能。  
值得一提的是，下載的Chrome App會和帳戶同步，意指重新安裝或者是到別台CloudReady電腦、Chromebit、Chromebox或是Chromebook上都會同步安裝

![](https://static-a1.steveyi.net/media/blog/2020081014561142.png)

  
在設定裡面可以調整各種選項，裡面的設定值也會同步

![](https://static-a1.steveyi.net/media/blog/2020081015000930.png)

有一個App叫做「檔案」，功能相當於Finder和檔案總管，可以管理檔案  
而且也會自動串接Google雲端硬碟，非常方便。

![](https://static-a1.steveyi.net/media/blog/2020081015012368.png)

![](https://static-a1.steveyi.net/media/blog/2020081015044386.png)

大致介紹完畢囉！祝各位用得愉快～  
螢幕快照的快速鍵是Ctrl+F5，會存在下載資料夾  
其餘快速鍵幾乎都跟Windows差不多，可以參考[這篇官方文章](https://support.google.com/chromebook/answer/183101?hl=zh-Hant "https://support.google.com/chromebook/answer/183101?hl=zh-Hant")
