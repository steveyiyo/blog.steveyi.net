---
title: '透過iperf3來測試內網速度'
date: Sun, 08 Nov 2020 13:26:11 +0000
draft: false
tags: ['伺服器']
---

不久前，筆者換了新的交換機。為了測試內網的傳輸速度，筆者發現了這款工具 - [iperf3](https://iperf.fr/iperf-download.php)

這是一個支援Ｗindows, Linux, macOS的測試程式，主要是透過指令來操作  
筆者也常常用來測試兩個不同地區伺服器的速度

![](https://static.yiy.tw/media/blog/2020110813145837.png)

那麼，以下分享一下安裝方法

首先，進入[iperf3官網](https://iperf.fr/iperf-download.php)後，找到對應的系統(如果是Windows就選擇Windows, macOS則選擇macos, Linux亦同...)  
  
會下載一個 .zip 的檔案，將其解壓縮

並打開命令控制字元（macOS及Linux則是Terminal也可以透過SSH進行操作），輸入 `cd <資料夾路徑>`，接著輸入 iperf3 指令

`iperf3 -s` #用於伺服端的  
`iperf3 -c <伺服端IP>` #用於客戶端的

![](https://static.yiy.tw/media/blog/2020110813255574.png)

就會開始跑測速啦！

大家比較需要注意的點是，在內網的話，需要確認內網是互通的(同一個LAN就是互通的)

![](https://static.yiy.tw/media/blog/2020110813230558.png)

我們也可以使用ping指令去測試網路是否通的，在部分設備上（如Windows），可能預設將ICMP屏蔽了。需要特別到防火牆裡面開啟