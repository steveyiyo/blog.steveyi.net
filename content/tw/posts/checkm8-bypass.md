---
title: "使用 checkm8 Activation Lock 免費版，繞過 iOS 啟用鎖定"
author: "SteveYi"
date: 2021-03-04T00:35:46+08:00
tags: ['iOS']
draft: false
Author: 蘿蔔
---

作者：蘿蔔

本文章同步發佈於「[蘿蔔ㄉ部落格](https://iambjlu.blogspot.com)」

[注意] 請勿用於商業或是非法用途。

這個軟體不是筆者所撰寫，如果使用上產生爭議，筆者恕不負責。  
繞過啟用鎖定需要使用到Mac電腦。

筆者使用的是自己的設備和自己的帳號做測試。(iPhone 7 Plus, iOS 14.3)  
有時候因為某些原因，將iPhone  
重置或更新時沒有關閉「尋找」，重新設定時會被要求Apple ID密碼來解除啟用鎖定，忘記Apple ID的密碼的話iPhone只能當作零件機或是一塊無用的磚頭。因此我們可能會需要繞過這道鎖定，至少還能當作遊戲機或是隨身聽使用。

筆者寫這篇文章時最新的iOS版本是iOS 14.4，官方標示支援的版本從12.4~14.4。<

官方標示支援的設備是：  
iPhone SE (第一代)  
iPhone 6  
iPhone 6S  
iPhone 7, 7 Plus  
iPhone 8, 8 Plus  
iPhone X  
iPad Air (1, 2)  
iPad Mini (2, 3, 4)  
iPad (5, 6, 7)  
iPad Pro (1, 2)  
iPad Pro (9.7 10.5 in.)

[注意] 部分功能在繞過啟用鎖定後會暫時失效 (包括但不限於下列)：  
行動通訊（無法撥打或接聽電話，也無法使用行動數據上網）  
iCloud雲端同步功能（也包含「[接續互通](https://support.apple.com/zh-tw/HT204681)」等需要帳號的功能）  
不建議安裝[軟體更新](https://support.apple.com/zh-tw/HT204204])  
重開機（會跳出啟用鎖定頁面，要重新進行操作）  
如果繞過後想起密碼，可以重開機，在啟用鎖定的地方輸入密碼，以上限制會被立馬破除

可以使用的功能(包括但不限於下列)：  
Wi-Fi上網  
藍芽功能 (AirPods可用)  
iTunes Store  
App Store  
Apple Music訂閱  
Apple Music同步資料庫  
各種App等

首先需要使用checkra1n進行越獄，到[https://checkra.in/](官網)

按下紅框標示的地方  

[![](https://1.bp.blogspot.com/-Bob3QMbUbuY/YEBNtXjtAgI/AAAAAAABlpU/OQKz2eBxp7cp_cFGq79Gbtt7a_XRRe9dACPcBGAYYCw/w550-h669/%25E6%2588%25AA%25E5%259C%2596%2B2021-02-12%2B%25E4%25B8%258B%25E5%258D%25883.13.11.png)](https://checkra.in/)

然後將越獄軟體checkra1n丟到Applications資料夾，就會在[啟動台](https://support.apple.com/zh-tw/HT202635)找到它，但是目前還沒要用到它。![](https://1.bp.blogspot.com/-LrCIMA-WhWk/YEBOnzJKp0I/AAAAAAABlpc/6UhEyq3ayNkzx2i38u-1IBDkhAX2K75wgCPcBGAYYCw/s772/%25E6%2588%25AA%25E5%259C%2596%2B2021-02-12%2B%25E4%25B8%258B%25E5%258D%25883.15.00.png)

![](https://1.bp.blogspot.com/-LrCIMA-WhWk/YEBOnzJKp0I/AAAAAAABlpc/6UhEyq3ayNkzx2i38u-1IBDkhAX2K75wgCPcBGAYYCw/w517-h357/%25E6%2588%25AA%25E5%259C%2596%2B2021-02-12%2B%25E4%25B8%258B%25E5%258D%25883.15.00.png)
  
接下來請到 checkm8.info 的[官網](https://checkm8.info/free-bypass-activation-lock-tool)按下橘色的「Download Free Version」下載  
軟體，照著步驟安裝完就可以關掉它，打開checkra1n進行越獄。  

如果不會越獄的話，網路上教學一大堆，在這裡就先不贅述。
  
## [ 裝置越獄完成後再進行以下操作 ]

請到[啟動台](https://support.apple.com/zh-tw/HT202635)，打開剛剛裝好的 checkm8.info Software [FREE VERSION]並連接越獄完的裝置，停留在啟用鎖定要輸入密碼的畫面，按下Start就可以看到神奇的事情發生了，進行一些基本設定後就可以使用設備啦。

![](https://1.bp.blogspot.com/-OygRsmhKE0s/YEBThZjmR5I/AAAAAAABlp8/tTGh-k65exsxrzj455QeBQbyz6B6NUAuACNcBGAsYHQ/s569/%25E6%2588%25AA%25E5%259C%2596%2B2021-02-12%2B%25E4%25B8%258B%25E5%258D%25883.16.24.png)

![](https://1.bp.blogspot.com/-OygRsmhKE0s/YEBThZjmR5I/AAAAAAABlp8/tTGh-k65exsxrzj455QeBQbyz6B6NUAuACNcBGAsYHQ/w516-h426/%25E6%2588%25AA%25E5%259C%2596%2B2021-02-12%2B%25E4%25B8%258B%25E5%258D%25883.16.24.png)

目前有測試幾個不能用的功能會像以下圖片所示：

雖然標示4G但實際上無法上網(用量875KB是在繞過啟用鎖定前的基本設定所存取的)

![](https://1.bp.blogspot.com/-wqzLc9wLBdg/YEBSxHkIP2I/AAAAAAABlps/kB1QNgk-0lUZGZJExlX99bzyA9AOavevgCPcBGAYYCw/s2048/IMG_140AD17C1604-1.jpeg)

![](https://1.bp.blogspot.com/-wqzLc9wLBdg/YEBSxHkIP2I/AAAAAAABlps/kB1QNgk-0lUZGZJExlX99bzyA9AOavevgCPcBGAYYCw/w360-h640/IMG_140AD17C1604-1.jpeg)

無法登入iCloud

![](https://1.bp.blogspot.com/-DmhSsVxHjLo/YEBTeGZk2zI/AAAAAAABlp0/OpQciqEUvjQQA87zDhnRKw9Ixtiy7FyjQCNcBGAsYHQ/s1120/%25E6%2588%25AA%25E5%259C%2596%2B2021-02-12%2B%25E4%25B8%258B%25E5%258D%25884.37.17.png)

![](https://1.bp.blogspot.com/-DmhSsVxHjLo/YEBTeGZk2zI/AAAAAAABlp0/OpQciqEUvjQQA87zDhnRKw9Ixtiy7FyjQCNcBGAsYHQ/w387-h640/%25E6%2588%25AA%25E5%259C%2596%2B2021-02-12%2B%25E4%25B8%258B%25E5%258D%25884.37.17.png)

無法撥出電話（電話撥入會直接轉到語音信箱）</div>  

![](https://1.bp.blogspot.com/-urhTRb61qj0/YEBTeOCOX4I/AAAAAAABlp4/IXUixciOGbAVE9jKIDC9XZ9zrorfmHa-wCNcBGAsYHQ/s2048/IMG_C0C2C5D6F028-1.jpeg)

![](https://1.bp.blogspot.com/-urhTRb61qj0/YEBTeOCOX4I/AAAAAAABlp4/IXUixciOGbAVE9jKIDC9XZ9zrorfmHa-wCNcBGAsYHQ/w360-h640/IMG_C0C2C5D6F028-1.jpeg)
  
本文章同步發佈於「[蘿蔔ㄉ部落格](https://iambjlu.blogspot.com)」部落格

```
      <script>

        window.fbAsyncInit = function() {

          FB.init({

            xfbml            : true,

            version          : 'v9.0'

          });

        };



        (function(d, s, id) {

        var js, fjs = d.getElementsByTagName(s)[0];

        if (d.getElementById(id)) return;

        js = d.createElement(s); js.id = id;

        js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';

        fjs.parentNode.insertBefore(js, fjs);

      }(document, 'script', 'facebook-jssdk'));</script>



      <!--Your Chat Plugin code-->

      <div attribution="install_email" class="fb-customerchat" page_id="105835291511389">

      </div>
```
