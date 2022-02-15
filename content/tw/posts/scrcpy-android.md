---
title: '使用 Scrcpy，由電腦操作 Android 手機'
date: Tue, 19 May 2020 15:41:11 +0000
draft: false
tags: ['Android']
Author: 蘿蔔
---

前情提要：由於筆者的手機螢幕忽然壞掉了，液晶會顯示但沒有背光照亮，需要用強光照射才能勉強查看畫面，但筆者依然需要使用該手機來搬移裡面重要資料以及測試Android程式等，所以一定要想辦法讓它可以操作！  (因為筆者目前主要使用iPhone)

![](https://static-a1.steveyi.net/media/blog/2020051917331789.jpg)

_（只能在強光照射下隱約看到畫面）_

  

需求:PC或是Mac、配備Android 5.0或更高版本的裝置

(官方說Linux也可以，但筆者沒有Linux電腦可以寫教學，因此建議您前往[官方教學](https://github.com/Genymobile/scrcpy)查看)

Android裝置需要先打開USB偵錯
-------------------

*   打開Android手機，找到關於手機的地方連戳版本號或是建置號碼，或是MIUI版本號  
    (每一支手機的做法不同這裡不列舉)

*   直到按到寫說「不需要了，您已經是開發人員」後，打開開發人員選項

(每支手機「開發人員選項」放的位置也不一樣，例如小米放在「設定>更多設定」內)

![](https://static-a1.steveyi.net/media/blog/2020051915343656.jpg)

*   接下來請打開開發人員選項，把USB偵錯(又稱USB調試)打開，如果是小米手機的話請一併打開安全設定，這個動作需要插入SIM卡並連接網路（MIUI的要求）  
      
    USB安裝建議打開，畢竟Scrcpy拖拉安裝安裝功能滿好用的([詳見這篇](http://blog.steveyi.net/scrcpy-android-apk))

![](https://static-a1.steveyi.net/media/blog/2020051915351328.jpg)

![](https://static-a1.steveyi.net/media/blog/2020052609195565.jpg)

*   「安全設定」彈窗請一路按下一步，記得要插SIM卡  
    (不然按到後來會跳出請插卡的提示）
*   如果遇到陌生電腦記得在手機上面按允許偵錯唷
*   接下來請到電腦進行環境安裝

PC環境安裝
------

*   請下載最新版[工具包](https://github.com/Genymobile/scrcpy#windows)並且解壓縮（筆者習慣解壓縮到C槽目錄下）  
    也可以跟ADB驅動安裝檔一起裝在隨身碟帶著走唷

[![](https://static-a1.steveyi.net/media/blog/2020051915360349.png)](https://github.com/Genymobile/scrcpy#windows)

![](https://static-a1.steveyi.net/media/blog/2020051915362241.png)

*   到[adb.clockworkmod.com](https://adb.clockworkmod.com/)按下白色的Download按鈕安裝ADB驅動

(如果有安裝過ADB驅動程式者請直接跳過這部分)

*   一路按下右下角的Next，預設選項夠我們用了

![](https://static-a1.steveyi.net/media/blog/2020051915363719.png)

*   要求權限的話就給他唄，請按「是」

![](https://static-a1.steveyi.net/media/blog/2020051915371217.png)

*   裝完請按Close

![](https://static-a1.steveyi.net/media/blog/2020051915371930.png)

*   打開Scrcpy所在資料夾，找到scrcpy-noconsole.exe並雙擊執行它，便可以操作了  
    

![](https://static-a1.steveyi.net/media/blog/2020052000172131.png)

![](https://static-a1.steveyi.net/media/blog/2020052000290950.png)

*   **控制方式**
    *   主要操作 : 滑鼠左鍵>點擊 .  滑鼠中鍵>回主畫面 . 滑鼠右鍵>返回

其他功能快捷鍵↓

動作

快捷鍵

全螢幕模式

Ctrl+f

調整視窗 1:1 比例

Ctrl+g

調整視窗將黑邊去除

Ctrl+x

主畫面

Ctrl+h 

返回

Ctrl+b

多工

Ctrl+s

菜單鍵

Ctrl+m

音量上鍵

Ctrl+↑

音量下鍵

Ctrl+↓ 

電源鍵

Ctrl+p

點亮螢幕

鎖屏時滑鼠右鍵

從電腦安裝 apk 檔案

拖拉APK檔案

Mac環境安裝
-------

*   請先安裝 Homebrew，如果有安裝過的話請跳過此步驟
    *   打開終端機（系統內建的工具程式）
    *   輸入  
        `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
    *   接下來照著指示執行
*   透過Homebrew安裝Scrcpy及其驅動
    *   完成後輸入  
        `brew cask install android-platform-tools`
    *   完成後輸入  
        `brew install scrcpy`
*   需要使用時則打開終端機輸入`scrcpy`即可使用  
    終端機視窗可以最小化，留下操作畫面沒關係

![](https://static-a1.steveyi.net/media/blog/2020051915380923.png)

*   **控制方式**

主要操作 : 滑鼠左鍵>點擊 .  滑鼠中鍵>回主畫面 . 滑鼠右鍵>返回

其他功能快捷鍵↓

動作

快捷鍵

全螢幕模式

Command+f

調整視窗 1:1 比例

Command+g

調整視窗將黑邊去除

Command+x

主畫面

Command+h 

返回

Command+b

多工

Command+s

菜單鍵

Command+m

音量上鍵

Command+↑

音量下鍵

Command+↓ 

電源鍵

Command+p

點亮螢幕

鎖屏時滑鼠右鍵

從電腦安裝 apk 檔案

拖拉APK檔案

使用效果
----

![](https://static-a1.steveyi.net/media/blog/2020051916163290.jpeg)