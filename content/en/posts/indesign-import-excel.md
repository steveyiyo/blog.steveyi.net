---
title: "Importing and Applying Excel Data in Indesign Templates"
date: 2023-02-19T01:07:22+08:00
draft: false
---

Recently, the SITCON Hour of Code one-hour programming event has ended! We are also preparing thank-you letters for the teaching assistants.

This time, we invited RuoyunLo to assist in designing the template, and we would like to share the process of importing Excel data and applying the template in Indesign.

## Prepare the Excel File

First, organize the data in the Excel file and place the "data names" in the first row.

**It is strongly recommended to use English for the data names, as they will replace the text in Indesign.**

![](https://i.imgur.com/7kVEsH4.png)

Save the data as a CSV plain text Unicode or UTF-16 (macOS users only) format.

## Import Excel Data

Open the designed template and start importing the CSV plain text file that was just downloaded.

Click "Data Merge" in the "Utilities" section of the "Window" menu.

![](https://i.imgur.com/3M7BDl0.jpg)

Select the data source.

![](https://i.imgur.com/C7EEvK0.jpg)

Choose the file.

![](https://i.imgur.com/Vz96C42.jpg)

After completion, you will see a screen like this.

![](https://i.imgur.com/v0tqGZu.jpg)

Replace the text in the template with "data names". This concept is similar to using variables.

![](https://i.imgur.com/5WceSwx.jpg)

Finally, click "Create Merged Document" to generate an independent Indesign document.

![](https://i.imgur.com/IVb53xR.jpg)

## Export as PDF Format
After confirming that everything is correct, export these documents in PDF format.

Click "Adobe PDF Presets" in the "File" menu, select "[High Quality Print]", and then save the document where you want it.

![](https://i.imgur.com/2F1E7By.jpg)

## Indesign Displays Gibberish When Importing CSV Data

This problem is mainly caused by the encoding of the CSV file. If you are a macOS user, you can use the following commands to check and correct it.

```bash
# Check encoding
file -I <file name>

# Convert encoding
iconv -f utf-8 -t utf-16 <file name> > <new file name>
```