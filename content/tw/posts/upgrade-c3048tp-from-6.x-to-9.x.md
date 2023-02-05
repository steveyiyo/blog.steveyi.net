---
title: "Cisco N3K-C3048TP-1GE 從 6.x 升級到 9.x 全過程"
date: 2023-02-06T01:51:10+08:00
draft: false
---

最近有一台 N3K-C3048TP-1GE 的版本太舊了，導致一些東西無法正常運作，所以決定升級到新版本，來解決這些問題！

大版本升級有一定的風險，請在看完本篇文章及 [官方文件](https://www.cisco.com/c/en/us/support/docs/switches/nexus-3048-switch/216023-nexus-3048-nx-os-software-upgrade-proced.html) 後再決定是否需要進行操作！

## 升級前的環境

Model: N3K-C3048TP-1GE-SUP  
NXOS: 6.0(2)U3(4)

重要提醒：  
這台 Switch 請一定要照著指南升級，不要一次升級到最新版本！
否則可能會導致你的設備變磚無法使用！

參考文件：
- [Cisco Nexus 3048TP Bricked](https://community.cisco.com/t5/switches-small-business/cisco-nexus-3048tp-bricked/td-p/3182064)
- [Upgrade Nexus 3048 NX-OS Software](https://www.cisco.com/c/en/us/support/docs/switches/nexus-3048-switch/216023-nexus-3048-nx-os-software-upgrade-proced.html)

## 升級版本路徑 (Upgrade Path)

1. 6.0(2)U3(4) <-- 最初版本
2. 6.0(2)U6(3a)
3. 7.0(3)I7(6)
4. 9.3(3)

## 從 6.0(2)U3(4) 升級到 6.0(2)U6(3a)

首先先取得對應的 bin 文件。

- n3000-uk9-kickstart.6.0.2.U6.3a.bin
- n3000-uk9.6.0.2.U6.3a.bin

> 比較特別的是在這個版本下，kickstar 及 nxos 是拆分的。

取得完成後輸入以下指令來安裝新版本，請自行修改對應目錄及檔案名稱。

```shell
install all kickstart bootflash:n3000-uk9-kickstart.6.0.2.U6.3a.bin system bootflash:n3000-uk9.6.0.2.U6.3a.bin
```

![](https://i.imgur.com/5NnAvVL.jpg)

當全部驗證完成後，請輸入 `y` 將新版本安裝到系統上。  
Switch 會在安裝完成後自動重啟。

![](https://i.imgur.com/jjaGYT9.png)

重開機後輸入 `show module` 來看看是否成功升級！

![](https://i.imgur.com/3stlea5.jpg)

## 從 6.0(2)U6(3a) 升級到 7.0(3)I7(6)

這邊的話，我們使用 `nxos.7.0.3.I7.6.bin` 作為升級文件。

直接輸入以下指令即可進入升級，請自行修改對應目錄及檔案名稱。

```shell
install all nxos bootflash:nxos.7.0.3.I7.6.bin`
```

升級完成後一樣輸入 `show module` 來看看是否升級成功！

![](https://i.imgur.com/XVEwapW.jpg)

## 從 7.0(3)I7(6) 升級到 9.3(3)

終於來到最後了！如果你的 NX-OS 版本在 7.x 的話呢，就可以直接升級到 9.x！

這邊我使用的是已經 Compact 完成的文件。由於系統硬碟不足，所以我先將檔案存在 USB，並將 log 刪除。

***
在安裝新版本的時候，還是會將 .bin 文件複製到系統內。
所以如果系統空間還是不足的話，會導致升級失敗喲！
***

- nxos.9.3.3.compact.bin

使用以下指令來進行升級，請自行修改對應目錄及檔案名稱。

```shell
install all nxos usb1:nxos.9.3.3.compact.bin
```

驗證完成之後，也記得要輸入 `y` 將新版本安裝進系統喲！

![](https://i.imgur.com/7Po780T.png)

最後重啟完成後，輸入 `show module` 來驗證看看是否成功更新～

![](https://i.imgur.com/pcDihVj.jpg)

## 結語

大版本安裝真的很麻煩且很危險！  

強烈建議在升級時連接 Console，防止網路斷掉導致無法得知最新狀況。另外也有可能導致你的設定檔遺失，請在升級前備份好目前的設定文件。

最後非常感謝 akw 及 Licson 在升級過程中提供協助！