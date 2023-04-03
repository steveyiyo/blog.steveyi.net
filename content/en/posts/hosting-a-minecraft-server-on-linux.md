---
title: "Hosting a Minecraft Server on Linux"
date: 2021-04-12T17:56:08+08:00
draft: false
---

Recently, a friend of mine wanted to set up a Minecraft server on Linux, so I decided to write down the process here!

## Environment

In this setup, I used the following operating system and packages:

* Ubuntu 20.04 Server
* byobu
* openjdk-8-jdk
* spigot 1.16.5

## Update System and Install Packages

To update the system, we enter the following command:

```
apt update -y
apt upgrade -y
```

Next, install Java and Byobu:

```
apt install openjdk-8-jdk byobu -y
```

![](https://static-a1.steveyi.net/media/blog/hosting-a-minecraft-server-on-linux-01.png)

## Deploy Minecraft Server

First, we create a folder to place the server files:

```
mkdir /data
mkdir /data/minecraft
cd /data/minecraft
```

Next, we download the Minecraft server core. Here, we use Spigot 1.16.5 and use wget to download it to the server:

```
wget https://cdn.getbukkit.org/spigot/spigot-1.16.5.jar
mv spigot-1.16.5.jar server.jar
```

After completion, we write a startup script:

```
java -Xmx2048M -Xms1024M -jar server.jar nogui
```

![](https://static-a1.steveyi.net/media/blog/hosting-a-minecraft-server-on-linux-02.png)

Now you can start your Minecraft server!