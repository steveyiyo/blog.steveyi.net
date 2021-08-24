---
title: '在 Linux 環境下無腦串接 Google 雲端硬碟'
date: Tue, 19 Jan 2021 12:25:49 +0000
draft: false
tags: ['Google', '免費資源', '生活小知識', '網際網路']
Author: 蘿蔔
---
此篇教學使用的是 google-drive-ocamlfuse 這個軟體，筆者使用的環境是基於Ubuntu的Zorin OS 15.2系統作為示範。

首先需要先加入軟體源，請在終端機輸入（可以直接把這一串直接拷貝貼上）

sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse
註：安裝過程可能需要輸入密碼，有些Linux發行版看不到輸入的密碼，打完按下Return就會繼續

安裝完成後，請在終端機輸入這個指令來啟動掛載的程式

google-drive-ocamlfuse
第一次運行的時候它會跳出瀏覽器視窗給用戶登入並選擇帳號，要求權限時請選擇同意。
成功之後會會跳轉到這個頁面（如下圖），並且在終端機看到這個訊息：

Access token retrieved correctly.

![](https://static.yiy.tw/media/blog/2021011913110433.png)

接下來請輸入這串指令，在Home Directory建立一個掛載用的檔案夾

mkdir ~/GoogleDrive
再接下來輸入這串指令就會完成掛載囉！

google-drive-ocamlfuse ~/GoogleDrive

![](https://static.yiy.tw/media/blog/2021011913111963.png)

掛載的位置會在Home Directory 底下的Google Drive資料夾

![](https://static.yiy.tw/media/blog/2021011913113183.png)

如果想要退出掛載的話，可以在終端機使用以下指令

fusermount -u ~/GoogleDrive
更多指令如果想要查詢看看，可以終端機輸入這個指令來做查詢

google-drive-ocamlfuse --help