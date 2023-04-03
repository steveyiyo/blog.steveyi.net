---
title: "Import and Apply Excel Data in Indesign Templates"
date: 2023-02-19T01:07:22+08:00
draft: false
---

Recently, the [SITCON Hour of Code programming event](https://hackmd.io/@SITCON/2022-HoC) has ended! We are also preparing thank-you notes for the teaching assistants.

This time, we asked [小妘](https://twitter.com/RuoyunLo) to help design the template, so I want to record how to import Excel data and apply the template in Indesign.

## Prepare Excel document

First, we organize the data in the Excel document and put the "data name" in the first row.

**The data name here will replace the text in Indesign, so it is strongly recommended to use English.**

![](https://i.imgur.com/7kVEsH4.png)

And save the data as a CSV text file in Unicode or UTF-16 (macOS user only) format.

## Import Excel data

Open the designed template and start importing the CSV text file downloaded just now.

Click "Utilities" in the "Window" and select "Data Merge".

![](https://i.imgur.com/3M7BDl0.jpg)

Select data source.

![](https://i.imgur.com/C7EEvK0.jpg)

Choose file.

![](https://i.imgur.com/Vz96C42.jpg)

After completion, you will see a screen like this.

![](https://i.imgur.com/v0tqGZu.jpg)

Replace the text in the template with "data name". The concept here is similar to variables.

![](https://i.imgur.com/5WceSwx.jpg)

Finally, click "Create Merged Document" to generate an independent Indesign document.

![](https://i.imgur.com/IVb53xR.jpg)

## Output PDF format

After confirming that there are no errors, we can export these documents in PDF format!

Click "Adobe PDF Presets" in "File", select "[High Quality Print]", and then save the document to the desired location.

![](https://i.imgur.com/2F1E7By.jpg)

## Indesign displays garbled characters when importing CSV data

This problem is mainly caused by the encoding of the CSV file. If you are a macOS user, you can use the following command to check and correct it.

```bash
# Check encoding
file -I <file name>

# Convert encoding
iconv -f utf-8 -t utf-16 <file name> > <new file name>
```