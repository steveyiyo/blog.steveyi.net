---
title: '32位元iOS裝置免電腦免SHSH 降級到8.4.1'
date: Mon, 30 Dec 2019 13:26:02 +0000
draft: false
tags: ['iOS']
---

![](https://static.yiy.tw/media/blog/2020/04/9564cd1098c2183afddb9be15db99ddf781db6b1-770x439_c.jpeg)

> 有時會因爲蘋果的部分問題，會在各種環節出狀況，如果有任何錯誤請改天再試
> 
> 蘋果的漏洞不是非常穩定，有一天我試了三次都不能用，改天再弄，一次就成功了，這有點碰運氣
> 
> iOS裝置如果很慢，降級會比較流暢
> 
> (A5裝置非常有感，A6、A6X裝置則差異不大但仍有比較快一點點)
> 
> 雖然還是偶爾會LAG一下但是至少改善滿多的
> 
> 例如轉場動畫不會像原本那麼卡頓

*   **適用裝置：**
*   iOS 9.0～10.3.3，有越獄的以下列出裝置
*   有附各版本越獄教學
*   iPhone 4S
*   iPhone 5
*   iPod Touch 5
*   iPad 2
*   iPad 3
*   iPad 4
*   iPad Mini 1代
*   \[iPhone 5C不適用\]

\*如有發生問題本人恕不負責\*

※其實我用到現在都沒事，上面那句希望只是備而不用

\*請先做好iTunes備份\*

\*中途若失敗或反悔可以使用DFU回到原版本或再試一次\*

\*請先清除所有內容和設定後再進行！\*

講了這麼多，來開工吧

——————分隔線——————

*   (如果已經越獄，請跳過此段)
*   越獄方法整理\[來自[瘋先生網站](https://mrmad.com.tw)\]
*   [10.X～10.3.3](https://www.google.com/url?q=https://mrmad.com.tw/h3lix&sa=D&ust=1577715419051000)
*   [9.3.5](https://www.google.com/url?q=https://mrmad.com.tw/phoenix-jailbreakable&sa=D&ust=1577715419052000)
*   [9.1~9.3.4](https://www.google.com/url?q=https://mrmad.com.tw/tihmstar-jailbreakme-4-0&sa=D&ust=1577715419052000)
*   [9.0.X](https://www.google.com/url?q=https://mrmad.com.tw/ios9-0-9-1-teachingios9-perfect-jailbreak-jailbreak-assault-pangu-jailbreak-tool-gives-you-the-perfect-escape-update-version-v1-3-1&sa=D&ust=1577715419052000)
*   降級完的8.4.1在文章底部

——————分隔線——————

此處以iPad 2(原9.3.5)做為示範

如果有Apple ID雙重認證，建議[關閉雙重認證](https://www.google.com/url?q=https://support.apple.com/zh-tw/HT202664&sa=D&ust=1577715419053000)或[註冊一組新的](https://www.google.com/url?q=https://appleid.apple.com/account%23!%26page%3Dcreate&sa=D&ust=1577715419053000)，並且要記得密碼，不然後續登入很麻煩！

降級前請將螢幕鎖定密碼關閉！！！否則可能會造成降級後無法解鎖裝置

1.越獄後使用iFile或Filza File Manager打開下方路徑的檔案

/System/Library/CoreServices/SystemVersion.plist

打錯了如果重開可能導致系統損毀需要重刷！

打錯也別擔心如果沒有重開的話只要更正存檔就可以放心重開了

Product Version改 6.1.3

ProductBuildVersion改 10B329

![](https://static.yiy.tw/media/blog/2020/04/backtoios841-2.jpg)

2.存檔修改後記得確認版本號無誤才可重開

![](https://static.yiy.tw/media/blog/2020/04/backtoios841-1.jpg)

3.重新啟動，重啟跑完進度條需要一段時間，開完機之後請重設裝置，設定精靈的地方隨便設，只要能進到主畫面就行了（不要還原任何的備份！），重設的地方在

設定->一般->重置->清除所有內容和設定
---------------------

重設之後進到設定檢查更新，會看到更新的地方有iOS 8.4.1的更新，點下去，並安裝

![](https://static.yiy.tw/media/blog/2020/04/backtoios841-3.jpg)

![](https://static.yiy.tw/media/blog/2020/04/backtoios841-4.jpg)

4.更新完成後請再次清除所有內容和設定

不然連系統APP都會閃退(例如「設定」內的「更改語言」)

已知重置的按鈕是可用的

![](https://static.yiy.tw/media/blog/2020/04/backtoios841-5.jpg)

![](https://static.yiy.tw/media/blog/2020/04/backtoios841-6.jpg)

5.如果有出現「啟用鎖定」的話需要使用這部裝置原來登入的Apple ID 密碼登入，再次設定後，即將完成!

![](https://static.yiy.tw/media/blog/2020/04/backtoios841-7.jpg)

![](https://static.yiy.tw/media/blog/2020/04/backtoios841-8.jpg)

![](https://static.yiy.tw/media/blog/2020/04/backtoios841-9.jpg)

下圖是另一部降級成功的第四代iPad

![](https://static.yiy.tw/media/blog/2020/04/backtoios841-10.jpg)

補充連結:

*   [8.4.1越獄](https://www.google.com/url?q=https://mrmad.com.tw/etason&sa=D&ust=1577715419056000)
*   [阻擋日後OTA更新的描述檔](https://www.google.com/url?q=https://mrmad.com.tw/technique-close-hide-ota&sa=D&ust=1577715419056000) 

\[建議使用，不然哪天自己升回去又要再來一次\]

安裝描述檔後

![](https://static.yiy.tw/media/blog/2020/04/backtoios841-11.jpg)

backtoios841-11.jpg

大功告成！