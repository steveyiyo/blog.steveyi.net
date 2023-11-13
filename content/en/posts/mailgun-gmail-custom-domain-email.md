---
title: 'Setting up Custom Email Domain with Mailgun and Gmail'
author: "SteveYi"
date: 2020-04-22T12:48:48+0000
draft: false
tags: ["Free Resources", "Domain", "Website Log"]
---

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-14.jpg)

As a child, I was always curious about the domain name of the sender in an email. Later, after getting involved in website development, I registered many domains (currently having about 6 domains), and gradually understood the doubts I had as a child.

Today, I will share with you the method of setting up custom email domain with Mailgun and Gmail!

First, register with [Mailgun](https://www.mailgun.com/), which offers 5000 free emails by default.
PS. If you are a GCP customer, you can apply for a free quota of 30000 on the [partnership page](https://www.mailgun.com/google/).

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-2-1920x1142.png)

After registration, we enter the console to add a domain (there will be a default domain).

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-3-1920x1142.png)

Enter the domain name above and check Create DKIM Authority below, selecting 1024-bit(private key) (some DNS service providers do not support 2048-bit).

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-4.png)

Next, set up DNS records. The MX record must be set (otherwise you will not receive any emails).
Note: If you have other email service providers (such as Gsuite, Office, etc.), do not set the MX record, otherwise the original service will not be able to receive emails.

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-5-1920x1142.png)

After setting up, wait for the DNS to take effect and move on to the next step!

Next, we will set up an SMTP account.

First, open the Mailgun console and click Domain Settings, then select SMTP credentials.

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-6-1920x1142.png)

Click New SMTP User in the upper right corner to create a new account.
The password is in the upper right corner! Remember it, as we will use it later.

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-7-1920x1142.jpg)

Next, let’s set up email forwarding.

Click Receiving on the left and then Create Route in the upper right.

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-8-1920x1142.jpg)

Next, select Match Recipient (specify the recipient) and enter the email address that was just created.
Fill in your Gmail email address under Forward below, and save it!
PS. If you select Cache All for the first item, all emails sent to this domain will be forwarded, which means unlimited aliases.

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-9-1920x1142.jpg)

After adding it, open Gmail Settings → More Settings → Accounts, and click Add another email address.

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-1-1920x1142.jpg)

Then enter a name (customizable) and the email address that was just created.

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-10.jpg)

Next, enter the SMTP server (select port 587tls), user account and password.
Mailgun's SMTP server is smtp.mailgun.org.

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-11.jpg)

Then verify the email ownership (the code will be sent to the Gmail mailbox just set up).

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-12.jpg)

You will receive a similar email:

![](https://static-a1.steveyi.net/media/blog/2020/04/mailgungmail-13-1920x1142.jpg)

Enter the verification code and you're done!

Epilogue: having a domain email is great (？🤩

Tool: [G Suite Toolbox](https://toolbox.googleapps.com/) (to check DNS issues)
