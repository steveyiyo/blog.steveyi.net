---
title: "在 Linux 系統上自架 Minecraft 伺服器"
date: 2021-04-12T17:56:08+08:00
draft: false
---

最近剛好有朋友也想在 Linux 上架設 Minecraft Server，那這邊就稍微寫一下架設過程好了！

## 環境

在這次的環境中，我使用了以下作業系統及套件

* Ubuntu 20.04 Server
* byobu
* openjdk-8-jdk
* spigot 1.16.5

## 更新系統 及 安裝套件

更新系統，我們輸入以下指令
```
apt update -y
apt upgrade -y
```

接著，安裝 Java 及 Byobu
```
apt install openjdk-8-jdk byobu -y
```

![](https://static.yiy.tw/media/blog/hosting-a-minecraft-server-on-linux-01.png)

## 部署 Minecraft 伺服器

首先，我們建立資料夾，來放置伺服器檔案
```
mkdir /data
mkdir /data/minecraft
cd /data/minecraft
```

接著，我們下載 Minecraft Server 核心  
這邊使用的是 Spigot 1.16.5，我們直接使用 wget 來下載到伺服器裡面
```
wget https://cdn.getbukkit.org/spigot/spigot-1.16.5.jar
mv spigot-1.16.5.jar server.jar
```

完成之後，我們寫一個啟動腳本
```
java -Xmx2048M -Xms1024M -jar server.jar nogui
```

![](https://static.yiy.tw/media/blog/hosting-a-minecraft-server-on-linux-02.png)

就開啟你的 Minecraft 伺服器囉！