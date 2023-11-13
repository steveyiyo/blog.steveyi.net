---
title: 'Windows 10 打開電腦(喚醒)後自動校正時間'
author: "SteveYi"
date: Fri, 20 Nov 2020 15:52:24 +0000
draft: false
categories: "科技"
tags: ["免費資源", "生活小知識"]
Author: 蘿蔔
---

時鐘對電腦來說是一個非常重要的東西，並不是只在狀態欄(或工作列)顯示時間那麼單純而已，時鐘不正確(與真實世界實際時間偏差太多)的話，可能會造成電腦發生一些奇怪的現象，例如:不能看網頁(憑證問題)，如果時間差太多甚至會造成軟體當掉。各種程式登入逾時也是很容易在時間偏差太大時發生的事情

![](https://static-a1.steveyi.net/media/blog/2020112014495468.png)

時間錯誤造成的憑證問題導致無法正常瀏覽網頁

![](https://static-a1.steveyi.net/media/blog/2020112015550593.png)

各種程式的登入逾時，iTunes就是其中之一

講到這裡，大家應該都想到了系統內建的自動校正時間功能

![](https://static-a1.steveyi.net/media/blog/2020112014523058.png)

系統的校正功能，筆者從來沒看過它自動幫我更正時間，每次都是去按\[立即更新\]才幫我更正時間 (它不會是每次喚醒電腦就對時，據說要好幾天才會更正一次)

偏偏筆者的雙A牌PC(筆記型電腦)和以前使用的PC桌機(CMOS沒電)，不論有沒有插電，只要Windows沒在運作(睡眠、休眠、關機、當機)，時鐘就會停止計算時間，每次開電腦都是看到上次關掉電腦的日期(或是被重設)，打開後還要手動調整實在很麻煩，因此研究了時鐘的自動校正功能，每逢開機就校正一次。

此處使用到的應用程式是[國家時間與頻率標準實驗室](https://www.stdtime.gov.tw/chinese/home.aspx "https://www.stdtime.gov.tw/chinese/home.aspx")推出的 [NTPClock](https://www.stdtime.gov.tw/chinese/exe/NTPClock.exe "https://www.stdtime.gov.tw/chinese/exe/NTPClock.exe")  
雖然有點古老，但功能至今依然正常  

NTPClock安裝教學
------------

首先請點這裡下載[NTPClock](https://www.stdtime.gov.tw/chinese/exe/NTPClock.exe "https://www.stdtime.gov.tw/chinese/exe/NTPClock.exe")，下載後請不要急著打開。  
請先將程式移至"C:\\NTPClock"資料夾(自己建立該資料夾)，然後在該程式按右鍵，選擇\[相容性\]，然後依序更改圖片圈起來的參數再打開  

![](https://static-a1.steveyi.net/media/blog/2020112015050958.png)

開啟時請允許權限，否則無法變更時間

![](https://static-a1.steveyi.net/media/blog/2020112015075546.png)

接下來程式會縮小在系統托盤，圖標點右鍵可以結束。

![](https://static-a1.steveyi.net/media/blog/2020112015113959.png)

設定開機自動使用NTPClock校正時間
--------------------

圖片太小的話可以右鍵在新分頁打開

依照NTPClock的預設設定，每次開啟該程式就會校正一次系統時間  
因此我們要用"工作排程器"設定每次解鎖電腦時會自動"以管理員權限"啟動NTPClock

首先請先在Windows搜尋找到"工作排程器"

![](https://static-a1.steveyi.net/media/blog/2020112015162761.png)

![](https://static-a1.steveyi.net/media/blog/2020112015362266.png)

接下來請到觸發程序的地方，調整紅色框起來的地方的設定如圖

![](https://static-a1.steveyi.net/media/blog/2020112015253737.png)

到動作的地方，調整紅色框起來的地方的設定如圖

![](https://static-a1.steveyi.net/media/blog/2020112015265857.png)

到條件的地方，調整紅色框起來的地方的設定如圖

更正圖片錯誤的部分：取消勾選「只有在電腦是使用AC電源時才啟用這個工作」

![](https://static-a1.steveyi.net/media/blog/2020112015284487.png)

到設定的地方，調整紅色框起來的地方的設定如圖

![](https://static-a1.steveyi.net/media/blog/2020112015293652.png)

接下來要設定當鎖定、登出、關掉電腦(睡眠、休眠、關機)時關掉NTPClock  
(不然如果不是關機或登出的話，每次打開電腦就會多開一個NTPClock，然後多開幾次電腦之後工作列就滿了)

![](https://static-a1.steveyi.net/media/blog/2020112015394495.png)

接下來請到觸發程序的地方，調整紅色框起來的地方的設定如圖

![](https://static-a1.steveyi.net/media/blog/2020112015422241.png)

到動作的地方，調整紅色框起來的地方的設定如圖

![](https://static-a1.steveyi.net/media/blog/2020112015435684.png)

到條件的地方，調整紅色框起來的地方的設定如圖

更正圖片錯誤的部分：取消勾選「只有在電腦是使用AC電源時才啟用這個工作」

![](https://static-a1.steveyi.net/media/blog/2020112015284487.png)

到設定的地方，調整紅色框起來的地方的設定如圖

![](https://static-a1.steveyi.net/media/blog/2020112015293652.png)

接下來每次打開電腦就會自動對時囉~  
如果電腦關掉後時間會跑掉的話，以後每次打開電腦都不用手動改時間了!
