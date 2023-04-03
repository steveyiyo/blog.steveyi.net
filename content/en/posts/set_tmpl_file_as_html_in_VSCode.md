---
title: "Set .tmpl files as HTML syntax in VSCode"
date: 2021-04-25T09:57:13+08:00
draft: false
---

When I started learning Golang recently, I used .tmpl as a web template. However, I found that it couldn't handle formatting automatically like HTML files. 
P.S. Even with related plugins installed, it only processes .html files.

After checking some related documents, I found that I can modify user settings to handle it. Here are two methods:

The first method is to directly modify the settings.json file and add the following code at the bottom:

```json
    "files.associations": {
        "*.tmpl": "html"
    }
```

![](https://static-a1.steveyi.net/media/blog/1619316651.png)

The second method is to go to Settings, click Text Editor, and add *.tmpl as html.

![](https://static-a1.steveyi.net/media/blog/1619316652.png)

![](https://static-a1.steveyi.net/media/blog/1619316653.png)

The final result will look like this!

![](https://static-a1.steveyi.net/media/blog/1619316650.png)