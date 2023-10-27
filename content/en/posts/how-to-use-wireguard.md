---
title: 'Using WireGuard on Linux'
author: "SteveYi"
date: Sat, 16 May 2020 11:51:52 +0000
draft: false
tags: ['BGP', 'server', 'WireGuard']
---

[WireGuard](https://wireguard.com) is a point-to-point encryption network. I have been using it to manage/connect all my cloud servers.

Today, let's share how to use WireGuard!

# Install WireGuard

Basically, the [WireGuard Install Page]((https://www.wireguard.com/install/)) provides complete installation methods and commands for various versions, so you can refer to it directly.

# Create WireGuard Profile

First, go to the WireGuard installation folder. If it does not exist, please create it.

```shell
cd /etc/wireguard
```

![](https://static-a1.steveyi.net/media/blog/2020051611394599.png)

Use the command to generate a public and private key, and use "cat" to view the contents of the public and private keys.

```shell
wg genkey | tee privatekey | wg pubkey > publickey
```

![](https://static-a1.steveyi.net/media/blog/2020051611445527.png)

Write down the public and private keys and create a configuration file.

```shell
nano wg0.conf
```

After entering the nano editor, we will paste the following configuration file and modify the public and private keys.

```
[Interface]
Address = 192.168.200.1/24 // You can customize the network segment here
SaveConfig = true
ListenPort = 51820
PrivateKey = <Replace with your private key>

[Peer]
PublicKey = <The other party's public key>
AllowedIPs = 192.168.200.2/24 // The other party's network segment
```

Enter Crtl + X and then y to exit the editor.

Use the following command to save and enable WireGuard.

```shell
wg-quick save wg0
wg-quick down wg0
wg-quick up wg0
```

PS. If you need to automatically start WireGuard after the system starts up, you can use the following command to write it into systemctl.

```shell
systemctl enable wg-quick@wg0
```

Then try pinging. If it responds, it means success!

![](https://static-a1.steveyi.net/media/blog/2020051612102187.png)
