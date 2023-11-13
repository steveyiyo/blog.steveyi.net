---
title: 'PVE入門心得-安裝篇'
author: "SteveYi"
date: Tue, 07 Jul 2020 05:33:14 +0000
draft: false
categories: "科技"
tags: ["伺服器", "網域", "虛擬化技術"]
---

玩虛擬機有一段時間了，不過是在Windows系統下裝VMware Workstation玩xD  
後來閒置了幾台電腦，恰好也查詢到PVE(Proxmox VE)這個開源虛擬系統，於是 我們就來安裝玩玩吧!

前期準備:

Proxmox VE 安裝碟  
高核心且空閒的電腦(不然跑起來會很卡)

首先，我們先到官方網站下載PVE的ISO檔案 [官網載點](https://www.proxmox.com/en/downloads)  
點擊左方的 [Proxmox VE 6.2 ISO Installer](https://www.proxmox.com/en/downloads/item/proxmox-ve-6-2-iso-installer) 來下載(6.2是版本號，右方則是種子下載)

![](https://static-a1.steveyi.net/media/blog/2020070100471381.png)

下載好之後，我們將檔案寫入USB中，做成安裝碟  
這邊推薦使用Etcher來寫入，[官網連結](https://www.balena.io/etcher/)

做好安裝碟之後，我們進入BIOS，並調整開機順序(將安裝碟設為第一順位)

接著我們就可以進行安裝了!

首先，選擇第一個 Install Proxmox VE

![](https://static-a1.steveyi.net/media/blog/2020070705281974.png)

接著同意服務條款

![](https://static-a1.steveyi.net/media/blog/2020070705274149.png)

選擇硬碟

![](https://static-a1.steveyi.net/media/blog/2020070705275335.png)

選擇國家及時區

![](https://static-a1.steveyi.net/media/blog/2020070705280757.png)

設置root密碼及電子郵件地址

![](https://static-a1.steveyi.net/media/blog/2020070705282498.png)

設置主機名稱及網路(這邊建議一次就設定好，不然後續修改IP有點麻煩)

![](https://static-a1.steveyi.net/media/blog/2020070705283457.png)

全部完成後，就點擊Install來進行安裝!

![](https://static-a1.steveyi.net/media/blog/2020070705284395.png)

安裝完成後，我們使用 https://你的IP:8006 就可以進入管理面板囉!

下一篇，我們將與大家分享一些配置的過程
