---
title: '淺談 Mac 筆記型電腦的電池和效能的影響'
author: "SteveYi"
date: Tue, 18 Aug 2020 13:16:25 +0000
draft: false
tags: ['生活小知識']
Author: 蘿蔔
---

筆者從小使用PC，直到家人幾年前買了一台MacBook Pro （額...對，不是我的，只是我借用時間比較長😂）

筆者第一台筆記型電腦是IBM的ThinkPad T43，接手時，電池因老化變得沒什麼用處（從開機到沒電休眠的續航大約3分42秒），所以大部分時候都把電池拔除來減輕重量，除非要在插座間移動才裝上。在這台電腦，以及後續我用的幾部PC筆記型電腦移除電池並插電使用都沒有任何明顯可見的降頻，只是後來換的PC筆記型電腦因為規格太文書，用幾年後跟不上軟體肥大的速度，容易當機，甚至多次在我存簡報時當機導致儲存失敗所以後來都借用家人的MacBok Pro。

直到家人那台Pro 2017卡鍵待送修，跟親戚借了塵封已久、電池無法充電的MacBook Air 2011來使用，原本以為只是不能拔掉電源而已，沒想到開機後用起來非常卡頓，根本不像是2代1.6GHz intel Core i5處理器該有的水準。在四處都看得到電池需要維修的警告後，我懷疑卡頓來自電池效能太低，系統做的降頻處理，就像[iPhone上的效能管理](https://support.apple.com/zh-tw/HT208387 "https://support.apple.com/zh-tw/HT208387")一樣。

![](https://static-a1.steveyi.net/media/blog/2020081811411362.png)

我使用了[intel(R) Power Gadget](https://software.intel.com/sites/default/files/managed/91/6b/Intel%20Power%20Gadget.dmg "https://software.intel.com/sites/default/files/managed/91/6b/Intel%20Power%20Gadget.dmg")看了一下，不出我所料，頻率被鎖定在最高(Core MAX)0.9GHz。

![](https://static-a1.steveyi.net/media/blog/2020081813104832.jpg)

後來在網路上找到Apple關於電腦沒裝電池降頻的說明（原本的網頁早已消失）：

> If the battery is removed from a MacBook or MacBook Pro, the computer will automatically reduce the processor speed (to 1Ghz).  
> This prevents the computer from shutting down if it demands more power than the A/C adaptor alone can provide.  
> Additional information:  
> Important: It is strongly recommended that you do not use your MacBook or MacBook Pro while the battery is removed. Accidently bumping the A/C adaptor could disconnect power and shutdown the computer. Any information that was not saved on your computer would be lost.  
> 
> 中文翻譯：  
> 如果電池從MacBook或是MacBook Pro移除，電腦會自動降低處理器頻率(到1GHz)。  
> 這防止電腦所需的電源超出電源供應器的負荷。額外資訊：  
> 重要：強烈建議您不要在MacBook或是MacBook Pro移除電池時使用。意外扯到電源供應器會讓電腦斷電並關機。任何未儲存在電腦裡的資訊都會遺失。

這麼看起來這顆「建議進行維修」的電池對系統來說，是跟沒電池一樣的。  

那我們如何可以檢查電池狀態呢？
---------------

我們可以打開「」(蘋果選單)後，按住option同時點擊「系統資訊」，之後在選單點選「電源」找到電池的各項資訊，其中電池循環使用次數是一個非常重要的指標。有關於循環次數的資訊可以參考[Apple官網](https://support.apple.com/zh-tw/HT201585 "https://support.apple.com/zh-tw/HT201585")。  
  
如果狀態不是標示「正常」，那麼筆者認為還是修一修吧。  
畢竟電腦用一用被電池搞到關機，不只沒存檔案的文件會遺失以外，連帶硬碟也有可能因為非正常斷電而損壞，到時資料不見更是得不償失。而且MagSafe設計雖然本意是防摔(而且筆者很喜歡)，但也就是說沒裝電池的時候踢到一下就關機了  
另外，即使睡眠模式設為Deep Sleep，無法蓄電的電池在睡眠也需要電源，拔除電源後睡眠暫存的狀態也會全部遺失。

![](https://static-a1.steveyi.net/media/blog/2020081812235896.png)

在此處我們得出一個結論
-----------

PC不插電池基本上不會受到影響，  
Mac不插電池或是電池被系統視為需要維修，則會嚴重影響使用體驗。  
  
如果在網路拍賣網站看到「電池已拆除」的Mac筆記型電腦，以為沒電池就可以撿便宜的朋友們，在購買前請思考一下更換電池需要的成本吧！除非你可以接受你買的電腦在這極低頻率下的運作速度和使用體驗。

8/21更新：  
經過筆者實測發現，使用舊版的OS X可以在CPU一樣被降頻的情況下獲得更好的使用體驗。  
所以等待更換電池的期間（或是根本不想換電池的話）可以考慮試試看舊版的OS X。  
筆者是使用OS X 10.9.5 "Mavericks"作為等待電池期間主要使用的作業系統，不過舊版OS X的應用程式相容性比較差，就請自行斟酌啦

![](https://static-a1.steveyi.net/media/blog/2020082115435852.png)
