---
title: "A capitalizations name issue can not build golang app"
date: 2022-03-29T17:40:28+08:00
draft: false
tags: ['Golang']
---

Recently, I'm working on a project which is a [URL Shortener](https://github.com/steveyiyo/URL-Shortener) with Golang.

Here is current architecture.

```
steveyiyo@SteveYis-MacBook-Pro-2 URL-Shortener % tree
.
├── README.md
├── config.yaml
├── config.yaml.example
├── data.db
├── details.md
├── dockerfile
├── go.mod
├── go.sum
├── internal
│   ├── cache
│   │   ├── cache.go
│   │   └── cache_test.go
│   ├── Database
│   │   └── database.go
│   └── Tools
│       └── tools.go
├── main.go
└── package
    └── utils
        └── utils.go

6 directories, 14 files
```

We can see there are some packages in the internal folder, with most capitalizations misused. (should be lowercase letters usually)

## What problems will this cause?

Since my developed machine is macOS which is under the APFS system. It will not particularly distinguish between upper and lower case.

Once I use the Linux system (ext4) to build the project, it will not work.

## How to fix it?

Rename the folder, and let the name be lowercase.

https://github.com/steveyiyo/URL-Shortener/commit/d4819bd0b8bb5b4816279fed405e66ecaecd6858
