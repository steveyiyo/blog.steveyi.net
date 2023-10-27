---
title: "在 VSCode 中將 .tmpl 檔案設為 HTML 語法"
author: "SteveYi"
date: 2021-04-25T09:57:13+08:00
categories: "科技"
tags: 網路
draft: false
---

前陣子開始學習 Golang 時，使用了 .tmpl 作為網頁模板

但發現，這樣不會像 HTML 檔案一樣，無法自動處理格式。  
P.S. 裝了相關外掛也只會處理 .html 文件

在查詢了一下相關文件後，發現可以修改使用者的設置來處理  
那這邊有兩種做法，我們來介紹一下

第一種是直接修改 settings.json 文件，在最下面新增以下程式碼

```json
    "files.associations": {
        "*.tmpl": "html"
    }
```

![](https://static-a1.steveyi.net/media/blog/1619316651.png)

第二種則是進入設定，點擊文字編輯器，文件。  
並新增 *.tmpl 為 html

![](https://static-a1.steveyi.net/media/blog/1619316652.png)

![](https://static-a1.steveyi.net/media/blog/1619316653.png)

最終結果就會像這樣啦！

![](https://static-a1.steveyi.net/media/blog/1619316650.png)
