---
title: 'macOS 重灌不求人！使用內建回復功能輕鬆重灌 Mac 電腦'
categories: ["科技"]
date: 2020-08-15T07:25:12+00:00
draft: false
tags: ["生活小知識"]
Author: 蘿蔔
---

很多時候很多種原因我們需要重灌作業系統，比如說系統裝了太多東西覺得變慢 懶得一個一個刪掉、或是換了新的磁碟機、升級Beta版想要降回來穩定發行版、或是系統升級過程中意外斷電等原因。Mac內建了一個好用的工具程式可以協助我們重灌。

開始教學囉
-----

首先請先將電腦開機，在蘋果圖像出現前按住command + R ，如果有韌體密碼會在此步驟要求解鎖。  
電腦會先嘗試使用內建的復原磁區開機，如果沒有找到復原磁區的話會使用Internet回復。  
Internet回復會使用Wi-Fi或乙太網路，如果找不到可用的網路就會出現驚嘆號的地球符號。  
  
\*如果使用的第三方鍵盤找不到command鍵，請把Windows符號鍵當作command使用。

![](https://static-a1.steveyi.net/media/blog/2020081506495963.png)

![](https://static-a1.steveyi.net/media/blog/2020081507285383.png)

螢幕快照擷取自Apple官網

如果沒有出現上圖畫面的話，接下來會照常以蘋果圖像開機

![](https://static-a1.steveyi.net/media/blog/2020081506552390.png)

開機完成後會看到可以選擇語言

![](https://static-a1.steveyi.net/media/blog/2020081507022867.png)

選完語言後會看到macOS工具程式

![](https://static-a1.steveyi.net/media/blog/2020081507032293.png)

如果是因為系統升級失敗(例如升級過程意外拔到插頭等)、刪錯kext驅動，請跳過磁碟工具程式的部分，直接前往第三頁，這會保留系統卷宗的資料和應用程式。

如果是想重灌（不保留系統卷宗資料）或是更換新的磁碟機，請繼續前往第二頁。

接下來要使用磁碟工具程式清除資料

![](https://static-a1.steveyi.net/media/blog/2020081507032293.png)

選擇系統的啟動磁碟或卷宗，命名並選擇格式然後按下清除  
  
如果有看到APFS格式選項（10.13以上才有)，建議選擇APFS。  
沒有的話就選Mac OS 擴充格式。

![](https://static-a1.steveyi.net/media/blog/2020081507114362.png)

完成後就可以把這視窗關掉，回到macOS工具程式了  

接下來就是重新安裝系統的時候了，請選擇重新安裝macOS

![](https://static-a1.steveyi.net/media/blog/2020081507180798.png)

接下來請按「繼續」，然後會看到使用條款。  
不同意使用條款就不能安裝。

![](https://static-a1.steveyi.net/media/blog/2020081507201737.png)

然後請選擇安裝於剛剛清除的磁區或卷宗

![](https://static-a1.steveyi.net/media/blog/2020081507212961.png)

接下來就等候安裝吧！  
安裝完會有基本設定，本篇就不贅述了，祝大家使用愉快～
