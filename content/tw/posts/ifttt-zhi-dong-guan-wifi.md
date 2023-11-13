---
title: '使用 IFTTT 讓手機在離開家裡時關閉無線網路'
categories: ["科技"]
date: 2020-06-03T04:43:06+0000
draft: false
tags: ["Android", "生活小知識"]
Author: 蘿蔔
---

由於筆者離開家裡的時候，常常忘記關掉Wi-Fi，所以就找出了這樣一個方法

首先我們會需要做準備工作，依照不同的裝置類型會有不同的方法

如果是小米或是Redmi、黑鯊、POCO手機的使用者
--------------------------

請先將IFTTT從最近應用程式中鎖定並允許自啟動、省電策略設為無限制，如果不是則請跳過此段。  
按住IFTTT預覽圖後會跳出下圖的選單

![](https://static-a1.steveyi.net/media/blog/2020060303272613.jpg)

接下來請確認IFTTT旁邊有小鎖頭之後，打開應用詳情，允許自啟動並將省電策略設為無限制，以免後台被殺。

![](https://static-a1.steveyi.net/media/blog/2020060303282266.jpg)

如果是Android 6.0至8.0  
(不含小米或是Redmi、黑鯊、POCO手機的使用者)
------------------------------------------------

安裝完成後請先至系統設定>電池(或電源)

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-8.png)

依照不同操作系統可能有不同的操作方式，以Google手機為例，需先按下右上角三個點之後點選電池效能最佳化

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-9.png)

然後在選單內找到IFTTT，選擇不要最佳化，以免後臺程序無法運行造成功能失常

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-10.png)

如果是Android 9.0至10.0  
(不含小米或是Redmi、黑鯊、POCO手機的使用者)
-------------------------------------------------

請到系統設定>應用程式和通知>特殊應用程式存取權  
依照不同操作系統可能有不同的操作方式  
以Google手機為例:

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-11.png)

然後點選電池效能最佳化

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-12.png)

找到IFTTT之後選擇不要最佳化

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-13.png)

準備工作完成

下一頁就開始進行設定囉！千萬別錯過～
------------------

使用前，需要先註冊或登入IFTTT ([ifttt.com](https://ifttt.com/))

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-1.png)

接下來他會推薦一個IFTTT的範例，按下X跳過

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-2.png)

接下來請打開IFTTT應用程式

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-14.png)

接下來請登入本文章一開始所使用的帳號

按下Got it和Get More

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-15.png)

![](https://static-a1.steveyi.net/media/blog/2020/04/ifttt-forward-to-line-16.png)

接下來請按下Create

![](https://static-a1.steveyi.net/media/blog/2020060303435439.png)

先按This，選擇Android Device

![](https://static-a1.steveyi.net/media/blog/2020060303470354.jpg)

![](https://static-a1.steveyi.net/media/blog/2020060303485738.png)

接下來選擇圈起來的選項

![](https://static-a1.steveyi.net/media/blog/2020060303492575.png)

接下來請輸入要觸發的WiFi名稱

![](https://static-a1.steveyi.net/media/blog/2020060314472031.jpg)

然後按That，也是選擇Android Device，然後選擇Turn off WiFi

![](https://static-a1.steveyi.net/media/blog/2020060303512548.png)

確認無誤後請按下Finish  
筆者建議把Recieve notifications when this runs的開關打開，這樣運作時IFTTT便會提醒你說Wi-Fi被關掉了

![](https://static-a1.steveyi.net/media/blog/2020060314480629.jpg)

如果要求位置資訊，請一律允許，不然他沒辦法正常運行

![](https://static-a1.steveyi.net/media/blog/IMG_20200603_120458.jpg)

Connected就表示已開啟

![](https://static-a1.steveyi.net/media/blog/2020060314505188.jpg)

效果示範如下

![](https://static-a1.steveyi.net/media/blog/2020060314511293.gif)

小米和黑鯊、Redmi、POCO手機每次運行時都會彈窗詢問是否允許，我們可以從應用詳情的地方選擇權限管理

![](https://static-a1.steveyi.net/media/blog/2020060314583324.jpg)

接下來找到「開啟WLAN」，並設為始終允許

![](https://static-a1.steveyi.net/media/blog/2020060314593226.jpg)

> 到這裡就完成囉！如果設定Applet執行時跳出通知，就會有下圖的效果哦～

*   ![](https://static-a1.steveyi.net/media/blog/2020061614302349.jpg)
    

#### 至於為什麼不要用Location定位去製作Applet呢？

因為只要有任何Applet用到Location服務，那IFTTT就會一直存取位置資訊，耗費電量，而且許多品牌的手機進入省電模式就會關掉定位功能，那麼這就沒辦法正常運作了

![](https://static-a1.steveyi.net/media/blog/2020060307230142.jpg)

只要任何一個Applet有用到Location服務，IFTTT就會一直使用定位
