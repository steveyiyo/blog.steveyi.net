---
title: "Encountering Dynamic Linking Library Missing Issue when Building Golang"
author: "SteveYi"
date: 2022-04-07T15:36:43+08:00
description: "During Golang build, encountering dynamic linking library missing issue..."
draft: false
---

Hi! Recently, I have been working on some Golang projects. While using Docker build image, I encountered some issues.

## Issue

After Docker image build is completed, the following error occurs when executing `docker run`:

```
standard_init_linux.go:211: exec user process caused "no such file or directory"
```

## Cause

Taking the project [URL-Shortener](https://github.com/steveyiyo/URL-Shortener) that I am currently working on as an example.  
In this project, I use the Library [go-sqlite3](https://github.com/mattn/go-sqlite3).

We can notice that [go-sqlite3](https://github.com/mattn/go-sqlite3) is written in C programming language. When we are building, we need to use GCC and CGO to construct. Therefore, we also need to set the CGO_ENABLED variable to 1 so that it can perform dynamic compilation.

- The command is like this  
    `$ CGO_ENABLED=1 CC=gcc go build -o /app/app main.go`

## Mini Image

Open two containers.

The first container 
- Execute `docker build` to build.
- Copy the completed binary file to the second container.

Install related packages in the second container and package it.

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
