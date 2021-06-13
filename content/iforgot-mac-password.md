---
title: '在忘記管理員帳號的 Mac 上新增新的管理員帳號'
date: Thu, 04 Jun 2020 05:54:21 +0000
draft: false
tags: ['生活小知識']
Author: 蘿蔔
---

之前筆者借用的一台iMac用到放假的時候，放在一個安全的地方，然後回家（搬不回去）。

過了一個多月再回來發現竟然忘了密碼（很誇張但是是真的，一直想不起來之前的密碼），幸好我在回家前就已經把資料都備份好了。

  
這可以重灌，但是因為筆者事情有點多所以沒空可以慢慢重灌，所以便找到了這麼一個方法，比重灌來的快多了，而且舊的帳號之後可以用新帳號去刪掉，App基本上也不用重新下載  
  
（當時有點忙所以這篇是後來寫出來的，就不是用iMac示範了）

> 注意：  
> 請不要將這篇用在不屬於你的(除非擁有者授權你的)電腦上，如果產生糾紛，筆者不負任何責任。  
> 如果要確保自己的電腦不會被macOS工具程式修改，請設定[韌體密碼](https://support.apple.com/zh-tw/HT204455#turnon)，但忘記密碼的話就也沒救了，只能尋求Apple官方協助了

首先請先將電腦關機後，再將電腦開機。  
在電腦開機時同時按⌘(command)和R，您會看到macOS工具程式。  
請在選單列的「工具程式」打開終端機

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405312140.png)

進入終端機後，請依序輸入以下指令，每行輸入完後要按 `return` 確認執行：

掛載磁碟機：

```
mount -uw /
```

讓電腦當作沒有開過設定精靈，讓下次開機出現設定精靈：

```
rm /var/db/.AppleSetupDone
```

立即重新啟動：

```
shutdown -r now
```

接下來開機應該會看到設定精靈

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405322859.png)

接下來就可以設定使用者帳號囉

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405331074.png)

接下來進入系統後，請登入並從選單打開系統偏好設定

![](https://static.yiy.tw/media/blog/2020060405381524.png)

接下來請打開「使用者與群組」

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405402392.png)

接下來請按鎖頭，並輸入剛剛的新帳號和新密碼

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405435722.png)

接下來在選單選擇要刪掉的使用者，並按下「-」按鈕之後，選擇檔案的處理方式後，按下刪除使用者，舊的使用者就消失囉～

![](https://blog.steveyi.net/wp-content/uploads/media/blog/2020060405491836.png)
