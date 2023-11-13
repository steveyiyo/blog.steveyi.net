---
title: "將任何 Tweet 置頂到自己的 Twitter 上"
author: "SteveYi"
categories: ["科技"]
tags: ["技術"]
date: 2021-04-07T19:00:27+08:00
draft: false
---

在今天，我滑 Twitter 時，發現了一篇有趣的推文...  
於是我馬上就跟 [@edisonlee55](https://edisonlee55.com) 分享這個趣事

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-00.png)

很明顯的發現，這個人將別人的推文轉推過來，並置頂在自己的個人頁面  

這看似很正常，但事實上「我們只能置頂自己發的推文」  
當我們點擊我們 retweet 的推文，我們沒有發現「置頂推文」的選項

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-08.png)

那麼... 當然要一點偏方了！  
跟 [@edisonlee55](https://edisonlee55.com) 進行快速的討論後，我們開始了實驗

首先，我們將瀏覽器的開發者工具打開  
理論上，點擊右鍵就可以看見了！

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-07.png)

接著，我們先進入 Network 的地方  
在對我們想要進行 pin 的推文按個愛心

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-06.png)

好那，我們看到了一個 HTTP POST 到 [create.json](https://twitter.com/i/api/1.1/favorites/create.json)

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-05.png)

我們也看到了一個 "id"，這個 ID 則是 Tweet 的 ID。先將他複製下來，等等會用到  
接著，我們還需要複製 Cookie, x-csrf-token, Bearer Token(Authorization) 等值，我們可以在 **Header** 上看到  
注意！請記得要保存好，不要隨意洩露這些值

接著，我們打開 Postman，選擇 POST  
URL 則為`https://twitter.com/i/api/1.1/account/pin_tweet.json?tweet_mode=extended&id=<id>`

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-04.png)

將 Header 與 Authorization 都設定好了後，我們點擊 Send  
我在第一次測試的時候，因為我沒有先 retweet 推文，所以系統 return 這個給我

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-03.png)

完成 retweet 後，我們再執行一次 POST。成功啦！

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-02.png)

接著，我們打開網站，刷新頁面。  
果然看到成功 pin 起來了

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-01.png)
