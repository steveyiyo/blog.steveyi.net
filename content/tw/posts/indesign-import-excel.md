---
title: "在 Indesign 模板中導入並套用 Excel 資料"
author: "SteveYi"
categories: ["生活"]
tags: ["Indesign"]
summary: "這篇文章分享了如何在 Indesign 模板中導入 Excel 資料的過程，從準備 Excel 文件、導入資料、到最終輸出 PDF 格式，並提供導入 CSV 資料時出現亂碼的解決方法。"
date: 2023-02-19T01:07:22+08:00
draft: false
---

最近 [SITCON Hour of Code 一小時寫程式](https://hackmd.io/@SITCON/2022-HoC) 的活動結束了！我們也在陸續準備感謝狀給助教們。

這次恰好請 [小妘](https://twitter.com/RuoyunLo) 來協助設計模板，所以就想來記錄一下如何在 Indesign 中導入 Excel 資料套用模板。

## 準備 Excel 文件

首先，我們先將 Excel 文件中的資料整理好，並且將「資料名稱」放在第一行中。

**這邊的資料名稱將會替換 Indesign 中的文字，強烈建議使用英文。**

![](https://i.imgur.com/7kVEsH4.png)

並將資料儲存為 CSV 純文字 Unicode 或是 UTF-16 (macOS user only) 格式。

## 導入 Excel 資料

將設計好的模板打開，就可以開始導入剛剛下載的 CSV 純文字文件了。

點擊「視窗」中的「公用程式」，選擇「資料合併」。

![](https://i.imgur.com/3M7BDl0.jpg)

選取資料來源。

![](https://i.imgur.com/C7EEvK0.jpg)

選擇文件。

![](https://i.imgur.com/Vz96C42.jpg)

完成後，會看到類似這樣的畫面。

![](https://i.imgur.com/v0tqGZu.jpg)

將模板中的文字，替換成「資料名稱」。這邊的概念有點像是變數。

![](https://i.imgur.com/5WceSwx.jpg)

最後，點擊「建立合併文件」，會產生一個獨立的 Indesign 文件。

![](https://i.imgur.com/IVb53xR.jpg)

## 輸出 PDF 格式

確認無誤後，我們就可以將這些文件匯出成 PDF 格式了！

點擊「檔案」中的「Adobe PDF 預設集」，選擇「[高品質列印]」，接著將文件儲存在想存放的位置。

![](https://i.imgur.com/2F1E7By.jpg)

## 遇到導入 CSV 資料時，Indesign 呈現亂碼的狀況

這個問題主要是 CSV 文件的編碼問題。如果你是 macOS 用戶，可以使用以下指令來確認並修正。

```bash
# 確認編碼
file -I <文件名稱>

# 轉換編碼
iconv -f utf-8 -t utf-16 <文件名稱> > <新文件名稱>
```
