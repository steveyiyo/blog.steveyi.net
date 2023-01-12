---
title: "將部落格從 WordPress 轉移到 Hugo"
date: 2021-02-10T14:27:17+08:00
draft: false
image: "https://i.imgur.com/1a3dW0f.png"
---

從 2018 年註冊了第一個網域 [steveyigame.com](https://whois.steveyi.net/whois/steveyigame.com) 後，我也嘗試架設了第一個 WordPress 部落格。

當時也正好學習使用 Linux 系統，順帶了解到 **雲端硬碟(像是 Google Drive)** 及 **檔案伺服器** 的差異

## 為什麼要換成 Hugo？WordPress 不好嗎？

我認為沒有好或不好這件事，一切憑個人感覺。

但由於逐漸學習到後端，會覺得說「如果可以靜態網頁就靜態，不要讓網站伺服器處理東西」。  
PS. 其實 WordPress 也可以優化到很好，但我純粹不想優化 XD。

另外，由於 WordPress 是動態網頁，且必須要與資料庫進行連接。一般用戶訪問網站時，網站會先到資料庫抓資料處理後再回應給用戶。

**我不想維護資料庫 R**

## 效能對比

我們來看看更換前跟更換後的具體差別好了。

- WordPress 載入速度

![](https://i.imgur.com/sNBNllD.jpg) 

- Hugo 載入速度

![](https://i.imgur.com/SxthIX9.png)

很明顯的可以看到，WordPress 網站初次載入需要花費 4.11 秒，而 Hugo 網站只需 1.41 秒，差異非常大。

## 關於 Hugo

由於 Hugo 是靜態網頁，所以想到可以將其部署在 GitHub，並搭配 GitHub Pages 使用。

於是我開了兩個 Repositories，一個用來放網站的原始檔案。  
當然，如果你想要開在同一個 Repo 下，利用不同的 branch 也是可以的！

- Hugo 原始碼

![](https://i.imgur.com/Ip6SEwt.png)

- 產生後的網站原始碼

![](https://i.imgur.com/ELvsgUd.png)

## 安裝 Hugo

首先，我們先在電腦中裝好 [Hugo](https://gohugo.io/)

Hugo 官方提供了以下系統預先編譯版，這代表這些系統不需要自行編譯！

- macOS (Darwin) for x64, i386, and ARM architectures
- Windows
- Linux
- OpenBSD
- FreeBSD

可以直接下載官方編譯好的檔案直接使用  
https://github.com/gohugoio/hugo/releases

若你是 macOS 使用者，也可以安裝 [Homebrew](https://brew.sh/) 並使用以下指令來安裝 Hugo
```
brew install hugo
```

## 設定 Hugo

接著，我們使用以下指令來建立一個新的網站
```
hugo new site 路徑
```
![](https://i.imgur.com/7zg789v.png)

接著，我們會看到這些檔案

![](https://i.imgur.com/ELrRBZY.png)

打開 config.toml 檔案，會出現這些，我們可以自定義為我們的網站
* baseURL
* languageCode
* title

![](https://i.imgur.com/x0zfGWq.png)

接著可以使用這個指令來新增新文章/頁面
```
hugo new post/hello.md
```

大致熟悉 Hugo 後，我們就來設定 GitHub 的部分吧！  
PS. 如果想更了解 Hugo 的操作方式，可以參考[官方文件](https://gohugo.io/getting-started/quick-start/)

## 在 GitHub 部署並搭配 GitHub Pages

1. 建立一個 Repository。  
2. 在部落格原始碼的 `.github/workflows` 目錄中，新增一個 GitHub Action 設定檔。

我在這邊使用了三個 Action，分別是以下三個：
- actions/checkout@v2
- peaceiris/actions-hugo@v2
- peaceiris/actions-gh-pages@v3

```yaml
name: Hugo Build and Deploy

on:
  push:
    branches:
      - main

jobs:
  build-deploy:
    runs-on: ubuntu-18.04
    steps:
      - uses: actions/checkout@v2
        with:
          submodules: true

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: '0.64.1'

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          deploy_key: ${{ secrets.ACTIONS_DEPLOY_KEY }}
          external_repository: 你的 username/你的儲存庫
          publish_dir: ./docs
          publish_branch: gh-page # 分支名稱
          cname: blog.steveyi.net # 若不使用自定義網域，則不需要
```

3. 將設定檔 commit 到 GitHub Repo 上。

![](https://i.imgur.com/TV5iCDF.png)

這時一定會遇到錯誤，這是因為我們沒有提供 ssh-key 給 GitHub Action 使用。

我們先建立一組 ssh-key  
接著，進入 Repository 的設定中，選擇 Deploy keys  
新增一組 Key，記得要勾選 Allow write access


![](https://i.imgur.com/QJ0PqtO.png)


接著到 secrets 的部分，將 SSH Key 的 Private Key 上傳上去  

![](https://i.imgur.com/7GbNJ2m.png)

最後，我們重新 commit 一次，就不會有錯誤了！

![](https://i.imgur.com/fJiQvwT.png)

同時，我們也可以訪問看看網站能不能瀏覽！  
PS. 有自定義網域的話，記得設定一個 CNAME 到 yourusername.github.io 哦！