---
title: '從終端機更改 Mac 的主機名稱'
date: Sat, 22 Aug 2020 08:25:56 +0000
draft: false
tags: ['生活小知識']
Author: 蘿蔔
---

打開終端機時，我們會看到一串字是「使用者@主機名稱」，例如 John@Johns-MacBook  
  
主機名稱理論上是可以從系統偏好設定裡頭的「共享」去更改，但是不曉得是不是系統的 Bug，筆者使用的電腦卻不能更改，為此搜尋了幾天終於得出了答案，可以從終端機更改主機名稱

  
首先請先打開終端機，然後輸入下面這串  
注意：請將下方的 "MacHostName" 帶換成你要的主機名稱，只能包含英文數字和連字號 (-)，並且盡量不要太長

```
sudo scutil --set HostName MacHostName
```

接下來請輸入密碼（看不到很正常）然後按下 return

接下來關掉終端機再打開就會看到新的名稱囉！

![](https://static-a1.steveyi.net/media/blog/2020082208224152.png)