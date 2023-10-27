---
title: "Juniper MX204 升級全過程"
author: "SteveYi"
categories: "科技"
tags: 網路
date: 2023-05-16T17:53:38+08:00
draft: false
---

最近有幸接觸了一台 [Juniper MX204](https://www.juniper.net/us/en/products/routers/mx-series/mx204-universal-routing-platform.html)，恰巧也順便將其升級到新版本。

這篇文章就來記錄一下升級的過程，以及遇到的問題。

## 升級的方法

一般來說，Juniper 可以透過以下兩種方式來升級系統版本：
- 透過 USB 隨身碟
- 透過網路

注意：此處是指升級 Junos OS，而不是從 Boot 重新安裝。

### 透過 USB 隨身碟

1. 進入 Shell 創建資料夾，並掛載 USB 隨身碟到 Juniper 設備。

```shell
# 進入 Shell
start shell user root

# 查看 USB 隨身碟的磁區
ls /dev/da*

# 創建資料夾
mkdir /var/tmp/usb

# 掛載 USB 隨身碟
mount_msdosfs /dev/da2s1 /var/tmp/usb
```

2. 將更新檔案複製到 Juniper 設備上。

```shell
# 確認檔案列表
ls /var/tmp/usb

# 將更新檔複製到 Juniper 設備上
cp /var/tmp/usb/junos.tgz /var/tmp
```

3. 更新 Junos OS。

```shell
# 回到 cli 後執行更新
request vmhost software add /var/tmp/usb/junos.tgz
```

### 透過網路更新

這個方法稍微複雜一點，需要先將 Juniper 設備的網路設定好，並且將更新檔案放到 HTTP Web Server 上。

1. 準備好更新檔案的 http 網址，並將檔案下載到 Juniper 設備上。

```shell
file copy "source" "destination"
```

2. 下載完成後，更新 Junos OS。

```shell
request vmhost software add "package_name"
```

一切完成後，需要執行 `request vmhost reboot` 重啟 Juniper 設備。

注意：這邊有個小提醒，由於 Juniper MX204 是 VM Base，所以如果使用 `request system reboot` 是不會將整個 Host 進行重啟的。

## 升級過程中遇到的問題

在 Junos OS 21.4R1 以後的版本，需要允許 SSH root 登入，才能夠進行升級。否則會導致 fpc 啟用失敗。
