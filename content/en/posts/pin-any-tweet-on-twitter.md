---
title: "Pin Any Tweet on Your Twitter Profile"
author: "SteveYi"
date: 2021-04-07T19:00:27+08:00
draft: false
---

Today, while browsing Twitter, I came across an interesting tweet...  
So I immediately shared it with [@edisonlee55](https://edisonlee55.com)

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-00.png)

It's obvious that this person has retweeted someone else's tweet and pinned it to their own profile page. 

This seems normal, but in fact, "we can only pin tweets that we ourselves have posted." 
When we click on a tweet that we retweeted, we don't see the "pin tweet" option.

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-08.png)

So... we need a little trick! 
After a quick discussion with [@edisonlee55](https://edisonlee55.com), we started experimenting.

First, we opened the browser's developer tools. 
In theory, we should be able to see it by right-clicking!

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-07.png)

Next, we went to the Network section and clicked the heart icon on the tweet we wanted to pin.

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-06.png)

Okay, we see an HTTP POST to [create.json](https://twitter.com/i/api/1.1/favorites/create.json).

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-05.png)

We also see an "id," which is the ID of the tweet. Copy it and we'll use it later. 
Next, we need to copy values such as Cookie, x-csrf-token, Bearer Token (Authorization), etc., which we can see in the **Header**. 
Note! Remember to save them well and don't disclose them casually.

Next, we opened Postman and selected POST. 
The URL is `https://twitter.com/i/api/1.1/account/pin_tweet.json?tweet_mode=extended&id=<id>`.

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-04.png)

After setting both the Header and Authorization, we click Send. 
When I tested it for the first time, I didn't retweet the tweet first, so the system returned this to me.

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-03.png)

After retweeting, we perform the POST again. Success!

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-02.png)

Next, we opened the website and refreshed the page. 
Sure enough, we saw it pinned successfully.

![](https://static-a1.steveyi.net/media/blog/pin-any-tweet-on-twitter-01.png)
