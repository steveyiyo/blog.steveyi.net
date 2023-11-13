---
title: '利用 redeb 來備份已安裝插件的 deb 檔'
categories: ["科技"]
date: Sat, 28 Nov 2020 04:39:14 +0000
draft: false
tags: ["iOS"]
Author: 蘿蔔
---

就在很久之前，筆者就有遇過插件在其他軟體源消失導致無法安裝想要的插件。但是因為在其他裝置有安裝該插件而能把該插件deb檔備份出來並安裝在我想要安裝該插件的裝置裡，在此分享給有想要備份插件的人！

*   ![](https://static-a1.steveyi.net/media/blog/2020112105432588.png)
    

redeb與備份出來的deb檔（以打包Zebra為例）

需要利用到的插件/程式：  
Redeb - deb重新打包備份插件（軟體源：[https://wiety.github.io/cydia/](https://wiety.github.io/cydia/) ）  
OpenSSH - 讓電腦可以ssh進去裝置裡並下指令  
FileZilla - SFTP存取裝置 (Windows部分也可用WinSCP)  
終端機 - 下達ssh指令（Windows使用者請用PuTTY)

前置作業：
-----

首先先在插件管理器（這邊以Zebra為例）上加入此軟體源： [https://wiety.github.io/cydia/](https://wiety.github.io/cydia/)

![](https://static-a1.steveyi.net/media/blog/2020112106035462.png)

往下滑進去"Wiety's beta repository"並找到redeb, 安裝它

![](https://static-a1.steveyi.net/media/blog/2020112106052890.png)

安裝OpenSSH (有安裝的可以跳過此步驟）

![](https://static-a1.steveyi.net/media/blog/2020112106070556.png)

安裝完這兩個插件後就可以移到電腦了

電腦端的操作：
-------

這邊要先注意一下，行動裝置與電腦皆要連接在同一個區網下，不然會連不上ssh!

先在要做ssh連線的裝置端確認內網IP位置（設定->Wi-Fi->在連線的Wi-Fi上按 "i"即可查詢）

![](https://static-a1.steveyi.net/media/blog/2020112802475870.jpeg)

筆者有自己製作簡易捷徑去查詢內網IP.

在電腦上打開終端機（Windows使用者請安裝PuTTY, 筆者這邊使用macOS)  
在終端機打上 ssh root@192.168.31.46 (紅色部分更換為自己的內網IP)  
打上要連線裝置的ssh密碼 (預設密碼是alpine. 這邊建議如果還在用預設密碼的，請更改成自訂的密碼！）

![](https://static-a1.steveyi.net/media/blog/2020112802562966.png)

在終端機上打入redeb, 會跳出圖左的訊息，這是因為我們沒預先指定好插件ID, 這邊鍵入"y". redeb會列出所有插件的ID（圖右）

*   ![](https://static-a1.steveyi.net/media/blog/2020112803005671.png)
    
*   ![](https://static-a1.steveyi.net/media/blog/2020112803010555.png)
    

這邊就是鍵入欲備份的插件ID, 這邊以Zebra為例，插件ID "206"

![](https://static-a1.steveyi.net/media/blog/2020112803044464.png)

執行完成後，終端機會長這樣：

![](https://static-a1.steveyi.net/media/blog/2020112803075785.png)

完成後，這邊就可以把剛打包好的deb檔從裝置中提起出來。接下來打開FileZilla並一樣ssh連線至剛剛做完deb打包的裝置。

在Filza中，按左上方的按鈕會打開該畫面，新增一個站台並把伺服器型態更改成SFTP. 最後把主機名稱（欲連線裝置的IP）, 使用者 (root) 跟密碼打上去並按下連線

![](https://static-a1.steveyi.net/media/blog/2020112803123820.png)

連線完成後，備份完成的deb檔位址在：

```
/private/var/mobile/Documents/Redeb/debs
```

![](https://static-a1.steveyi.net/media/blog/2020112803211495.png)

在資料夾裡面的檔案就是剛剛備份的deb檔，這樣就完工了！
