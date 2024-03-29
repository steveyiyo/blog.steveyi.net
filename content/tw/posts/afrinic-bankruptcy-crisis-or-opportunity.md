---
title: "AFRINIC 破產是危機還是轉機 - 數百萬 IPv4 地址的爭議故事"
author: "SteveYi"
categories: ["網路治理"]
tags: ["法律"]
summary: "這篇文章詳細介紹了 AFRINIC 的破產事件及其背後的爭議，探討了 AFRINIC 的角色、職能，以及它在全球網路資源分配中的重要性。文章透過 Cloud Innovation 事件揭露了 AFRINIC 內部管理和網路資源分配的問題，並討論了相關法律訴訟的影響。此外，文章也探討了網路治理的重要性，包括多方利害關係人框架下的決策過程，並鼓勵讀者參與網路治理。最後，文章將 AFRINIC 的危機視為推動網路治理結構向前邁進的契機，並提供了參與網路治理的方式。"
date: 2023-10-27T04:17:04+08:00
draft: false
---

我從 2021 年就開始關注 AFRINIC 的相關爭議事件，這幾天其宣布破產保護更讓我震驚。這篇文章就來分享一下 AFRINIC 一直以來的爭議及我的論點吧！

## AFRINIC 是什麼來頭？他對我們的影響有哪些？

AFRINIC 大家可能比較陌生，但相信對網路治理有興趣的朋友們多多少少都有聽過 Regional Internet Registries (RIR) 區域網際網路註冊管理機構吧！

在全球共有五大 RIR，負責分配全世界的所有網路資源（包括 IP 地址、AS 號碼），分別為：

- APNIC 亞太網路資訊中心
- RIPE NCC 歐洲網路資訊中心
- ARIN 北美網際網路註冊中心
- AFRINIC 非洲網路資訊中心
- LACNIC 拉丁美洲和加勒比網域名稱註冊管理機構

而其中，AFRINIC 則負責分配「非洲地區」及「印度洋地區」的網路資源，意思就是整個非洲地區所有的 IP 地址都由他們負責分配及管理。

你可能會好奇...

> Q: 如果沒有 IP 地址會怎麼樣？
> 
> IP 地址作為全球唯一的識別碼，其概念類似於身分證字號，負責判斷使用者的位置。當網際網路的另一端收到該 IP 的請求，會透過「路由」將回傳資料一路送回。
如果沒有 IP 地址，將無法與網際網路連接，無法做任何事情。

## 除了 RIR，你還必須知道 ICANN, ASO & NRO。

你可能好奇，五大 RIR 不是已經管理全球所有 IP 地址了嗎？這些組織是什麼？

ICANN 全名 Internet Corporation for Assigned Names and Numbers，負責：

- 全球的 Domain Name
- Internet Resource
- 維護 L Root Server
- 將網路資源下發給全球五大 RIR 管理

所以邏輯上我們可以想成

1. ICANN 擁有這些資源 ->
2. 分配給 RIR ->
3. RIR 分配給 ISP/NSP, Company ->
4. ISP 最終提供服務給使用者！

### 那麼，ASO & NRO 又是什麼呢？

ASO 全名 Address Supporting Organization Address Council，負責制定 IP 地址的相關建議，包括使用、分配及管理相關的政策問題。

NRO 則是 Number Resource Organization，負責履行 ASO 的角色，並作為五大 RIR 的協調員角色。其在這次 AFRINIC 事件當中扮演很重要的角色。

## AFRINIC 到底發生了什麼事情？

講了這麼多，大家一定很好奇 AFRINIC 到底發生了什麼事情？為什麼他們要聲請破產保護？

AFRINIC 的高層從 2018 年起開始有很嚴重的腐敗問題，超過 8 億個非洲 IPv4 地址被非法分配給可疑的 Legal Entity，而我從 RIPE NCC Mailing list 有耳聞到相關資料...

> 目前單一 IPv4 地址的價格將近 30 USD，擁有 8 億個 IPv4 地址則...（大家懂的

該事件延續到與企業進行法律訴訟，甚至導致 AFRINIC 的銀行帳戶被法院凍結。

### Cloud Innovation 事件

Cloud Innovation 是一間立案於非洲島國塞席爾的企業，其負責人為 Lu Heng。他們分四次，從 AFRINIC 取得將近 620 萬個 IPv4 地址。是目前爭議最大的企業之一。

AFRINIC 與其在糾紛於 2020 年開始，短短三年內 Cloud Innovation 已透過法院向 AFRINIC 提起 36 個訴訟，詳細訴訟列表可參考 [List of Court Cases involving AFRINIC](https://www.afrinic.net/court-cases)。

以下提出最重要的幾個時間軸，更詳細的資訊可參考 [AFRINIC Litigation related Frequently Asked Questions (FAQs)](https://www.afrinic.net/corporate-documents?view=category&id=15)。

| 時間       | 事件                                                                                          |
|------------|------------------------------------------------------------------------------------------------|
| 2020/06    | AFRINIC 注意到 Cloud Innovation 違反其 IP 分配使用規則及 RSA 相關行為，要求他們做出解釋並修改。     |
| 2021/03    | AFRINIC 發現仍違反規定，開始履行 RSA 的合約流程，並明確指出將收回 IP 地址。                      |
| 2021/07    | Cloud Innovation 向毛里求斯最高法院提起法律訴訟程序，以防止 AFRINIC 收回 IP 地址。                |
| 2021/10    | Cloud Innovation 申請法院凍結 AFRINIC 銀行帳戶，獲得批准。而同年 12 月撤回申請。                      |
| 2022/02    | Cloud Innovation 於 2021/07 提起的訴訟被法院駁回。                                          |

AFRINIC 也針對該事件整理出了一份 PDF 文件 - [Litigation between AFRINIC and Cloud Innovation](https://afrinic.net/ast/afrinic-press-release-litigation-20220825-en.pdf)。

也因為該事件的處理過程，導致 AFRINIC 營運資金被凍結，瀕臨維運危機。看到這裡，你可能好奇 Cloud Innovation 到底違反了哪些規則，而 RSA 又是什麼？

### AFRINIC RSA (Registration Service Agreement)

> 資料參考於 [AFRINIC 官方網站](https://afrinic.net/membership/agreements)

RSA 的條款適用於在 AFRINIC 持有網路資源的會員，包括 ASN, IPv4 及 IPv6 地址。在取得資源、成為會員後，必須要遵守其規範。

而 Cloud Innovation 則是違反「實際使用與當初申請資源時的理由不符」、「將 IP 地址用於非洲地區以外的國家」等，根據註冊服務協議，AFRINIC 有權收回網路資源並重新分配給真正有需要的使用者 / 企業。

### 其他 RIR (ARIN) 的爭議故事

在 AFRINIC 之前，Lu Heng 曾透過其他方式向 ARIN 申請 IPv4 地址被拒絕。ARIN 認定申請不符合規定：

- 拒絕提供 ARIN 要求的資料。
- 提供誤導且不一致的申請原因。
- 在北美地區沒有使用 IP 地址的商業目的，若其取得地址將用於非 ARIN 服務區域的使用。

延伸閱讀：由 ARIN CEO John Curran 所撰寫的 [AFRINIC and the Stability of the Internet Number Registry System](https://www.arin.net/blog/2021/08/27/afrinic-and-the-stability-of-the-internet-number-registry-system/)。

## 透過法治面向，如何證明網路治理的韌性？

其實除了 AFRINIC 事件，其他 RIR 也有遇過「透過不合法方式取得網路資源」。

2019 年，美國南卡羅來納州地區的聯邦檢察官起訴 Charleston Man，以非正當方式向 ARIN 取得超過 900 萬美元價值的網路資源，並在 2023/09 被判處五年的聯邦監獄有期徒刑。[詳情](https://www.justice.gov/usao-sc/pr/charleston-man-and-business-indicted-federal-court-over-9m-fraud)。該事件警訊所有使用者不要以「欺詐」行為來取得 IP 地址。

## 作為網路使用者，網路治理對我們的生活有哪些影響？

ICANN, RIR 又或者是 NRO，這些組織作為中立機構，對待所有網路公民都必須是平等的。多方利害關係人 (Multistakeholder) 從個人、企業到政府的不同觀點更體現這種架構的韌性。

還記得 2022/02 俄烏戰爭爆發之際，烏克蘭總理發信要求 ICANN 及 RIPE NCC 歐洲網路管理機構，停止對俄羅斯網域的 DNS 解析及收回 IP 俄羅斯國內所有 IP 地址。後來這個請求都被雙方拒絕，RIPE NCC 特別提供一個網頁 [The RIPE NCC and Ukraine/Russia](https://www.ripe.net/participate/member-support/the-ripe-ncc-and-ukraine-russia) 專門分享此事件。

> 雖然 RIPE NCC 拒絕烏克蘭凍結俄羅斯網路資源的請求，但 RIPE NCC 畢竟是一個位於荷蘭的法律實體，必須要遵守歐盟及荷蘭的法規。網路資源被訂定為 "economic resources" 屬於歐盟制裁法規所定義的，必須凍結受制裁實體的相關資源。
> 
> 一旦法律強制力要求制裁俄羅斯，RIPE NCC 將透過凍結資料庫的網路資源註冊，代表受制裁實體無法取得更多資源或轉移資源。
> 
> 若有興趣可以參考 RIPE NCC 的聲明文章 - [EU Sanctions and Our Russian Membership](https://labs.ripe.net/author/athina/eu-sanctions-and-our-russian-membership/)

## 結語

AFRINIC 的破產宣告不僅是一次網路資源管理機構面臨的危機，更是考驗全球網路治理的一大轉捩點。這場涉及數百萬個 IPv4 地址使用權及 RIR 內部管理，不僅展現區域性網路資源管理的重要性，同時也凸顯網路資源分配嚴格審查及社群透明化的必要性。

網路治理的韌性、多方利害關係人框架下對於地緣政治的壓力也在這些事件充分表現。透過法律訴訟以及 RIRs/NRO 的協調與合作，更可以體現法治層面的影響力。

面對未來，無論是 RIR、ICANN、或是其他網路治理組織，都需更加堅守原則及透明化，確保每一個使用者的權益。

> 提到透明度，在台灣，大部分 IP 地址都是由 TWNIC (APNIC's NIR) 所分配，其委員會包括管控 IP 地址及網路協定委員會，我時常翻閱他們的 [會議紀錄](https://www.twnic.tw/committee_ip_record.php)，去了解他們的透明度問題。
>
> 不過我也挺好奇，為什麼 IP 地址委員會的委員不是由 IP 使用者 / TWNIC 會員選舉而成，而是由其「主任委員提請董事會同意後聘任之」。這點值得我們思考。

### 是危機還是轉機？

相信各位讀者看到這邊，一定很好奇這到底是危機還是轉機？我認為這是推動全球網路治理結構向前邁進的契機。未來一旦發生類似事件，就有歷史可以參考，也可以在規範上杜絕事件的發生。

當然，作為網路公民，如果某天我們遇到地緣政治或來自第三方的壓力，我們該如何捍衛使用網路的權益？這個問題就留給大家思考了 XD

### 如何參與網路治理？

在多元利害關係人的框架之下，不同身份，無論是學生、青年、職場人士、企業、網路服務提供商，乃至政府代表，在政策決策中都扮演重要的角色。這些不同的聲音都可能對政策制定帶來影響，從而促成各種變化。

在台灣，你可以透過這些會議、社群來參與：

- [TWIGF 台灣網路治理論壇](https://www.igf.org.tw/)
- [ICANN APAC-TWNIC Engagement Forum](https://forum.twnic.tw/)
- [TWNOG](https://www.facebook.com/groups/twnog/)

亞洲：

- [APrIGF 亞太區域網路治理論壇](https://ap.rigf.asia/)
- [APNIC 亞太網路資訊中心](https://www.apnic.net/)
- [yIGF (Youth Internet Governance Forum)](https://www.yigf.asia/)

## 其他相關閱讀

- [Micfo’s Amir Golestan Sentenced to 5 Years in Federal Prison for Defrauding ARIN](https://www.arin.net/blog/2023/10/16/micfo-golestan-sentencing/?fbclid=IwAR21WVvr96m1nNUE_ZqYllceUvAml4nHrVTqKXmF1FH7C0Ee8Qs1MA3pttY)
- [RIRs Message to the AFRINIC Community](https://www.nro.net/rirs-message-to-the-afrinic-community/)
