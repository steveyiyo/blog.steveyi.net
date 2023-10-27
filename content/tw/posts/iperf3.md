---
title: '透過 iperf3 來測試內網速度'
author: "SteveYi"
date: Sun, 08 Nov 2020 13:26:11 +0000
draft: false
tags: ['伺服器']
---

不久前，筆者換了新的交換機。為了測試內網的傳輸速度，筆者發現了這款工具 - [iperf3](https://iperf.fr/iperf-download.php)

這是一個支援 Ｗindows, Linux, macOS 的測試程式，主要是透過指令來操作  
筆者也常常用來測試兩個不同地區伺服器的速度

![](https://static-a1.steveyi.net/media/blog/2020110813145837.png)

那麼，以下分享一下安裝方法

首先，進入 [iperf3 官網](https://iperf.fr/iperf-download.php)後，找到對應的系統(如果是 Windows 就選擇 Windows, macOS 則選擇 macos, Linux亦同...)  
  
會下載一個 .zip 的檔案，將其解壓縮

並打開命令控制字元（macOS 及 Linux 則是 Terminal 也可以透過 SSH 進行操作），輸入 `cd <資料夾路徑>`，接著輸入 iperf3 指令

`iperf3 -s` #用於伺服端的  
`iperf3 -c <伺服端IP>` #用於客戶端的

![](https://static-a1.steveyi.net/media/blog/2020110813255574.png)

就會開始跑測速啦！

大家比較需要注意的點是，在內網的話，需要確認內網是互通的(同一個 LAN 就是互通的)

![](https://static-a1.steveyi.net/media/blog/2020110813230558.png)

我們也可以使用 ping 指令去測試網路是否通的，在部分設備上（如 Windows），可能預設將 ICMP 屏蔽了。需要特別到防火牆裡面開啟
