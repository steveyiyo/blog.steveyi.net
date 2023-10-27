---
title: '在 Linux 環境下設定 IPSec 點對點隧道'
author: "SteveYi"
date: Sun, 13 Jun 2021 23:05:00 +0000
draft: true
tags: ['IPSec', 'BGP', '網際網路']
---

前陣子，拿到了一台新的伺服器，但那邊的網路環境必須要經由 IPSec 加密，否則使用 GRE Tunnel 封包會被看光光

apt install charon-systemd libcharon-extra-plugins libstrongswan-extra-plugins
