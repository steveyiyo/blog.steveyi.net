---
title: "在 Golang build 時，遇到動態連結庫遺失的問題"
author: "SteveYi"
date: 2022-04-07T15:36:43+08:00
description: "在進行 Golang build 時，遇到動態連結庫不存在的問題..."
categories: "科技"
tags: ["技術"]
draft: false
---

Hi! 最近在寫一些 Golang 的專案。在使用 Docker build image 時，發現了一些問題。

## 問題點

Docker image build 完後，執行 `docker run` 時出現以下錯誤

```
standard_init_linux.go:211: exec user process caused "no such file or directory"
```

## 原因

以我目前在寫的專案 [URL-Shortener](https://github.com/steveyiyo/URL-Shortener) 為例。  
在這個專案中，我用到了 [go-sqlite3](https://github.com/mattn/go-sqlite3) 這個 Library。

我們可以注意到 [go-sqlite3](https://github.com/mattn/go-sqlite3) 是以 C programming 來寫的。當我們在 build 時，需要使用到 GCC 及 CGO 來構建。所以我們也需要將 CGO_ENABLED 的變量設為 1，使其可以進行動態編譯。

- 執行指令就像這樣  
    `$ CGO_ENABLED=1 CC=gcc go build -o /app/app main.go`

## Mini Image

開兩個 Container

第一個 Container 
- 執行 `docker build` 進行 build。
- 將 build 完成的 binary file 複製到第二個 Container。

在第二個 Container 中安裝相關套件，打包。

```Dockerfile
FROM golang:1.18-alpine3.15 as builder

RUN apk --update upgrade \
    && apk add --no-cache sqlite gcc g++ \
    && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . .
RUN  CGO_ENABLED=1 CC=gcc go build -o /app/app main.go

FROM alpine:3.10

# Install for go-sqlite3 use
RUN apk --update upgrade \
    && apk add --no-cache sqlite \
    && rm -rf /var/cache/apk/*

COPY --from=builder /app/app /app/
WORKDIR /app
CMD ["./app"]
```
