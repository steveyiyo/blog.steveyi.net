---
title: '使用 Scrcpy 輕鬆安裝 APK 檔案到手機內'
date: Wed, 20 May 2020 08:52:47 +0000
draft: false
tags: ['Android']
Author: 蘿蔔
---

![](https://static-a1.steveyi.net/media/blog/2020052008515768.png)

首先我們會先需要安裝Scrcpy並打開它。  
[安裝方法在此](https://blog.steveyi.net/scrcpy-android)  

如果使用的是小米手機(如果不是的話請跳過這部分)，  
請先到「設定」>「更多設定」>「開發人員選項」，允許USB安裝  
這個動作需要插入SIM卡（MIUI的要求）

![](https://static-a1.steveyi.net/media/blog/2020052014230696.jpg)

請把準備好的APK的Finder或是檔案總管視窗開在一旁，將檔案拉進Scrcpy視窗  
（手機畫面可以是任何地方，不一定要開在程式集的畫面）

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020052008324389.gif)

然後Mac用戶的話應該會看到終端機視窗內出現文字  
`Request to install...`  
以及  
`Performing Push Install...`

![](https://static-a1.steveyi.net/media/blog/2020052008374716.png)

此時手機正在安裝APK，安裝所需時間視手機速度而定

如果使用的是小米手機，那麼請在手機上允許安裝，否則會被系統攔截而安裝失敗

![](https://static-a1.steveyi.net/media/blog/2020052014251266.jpg)

  
完成時Mac終端機視窗會寫「`Success`」表示安裝成功  
實測安裝完的程式也能正常開啟的

![](https://static-a1.steveyi.net/media/blog/2020052008425289.png)

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020052008464950.gif)