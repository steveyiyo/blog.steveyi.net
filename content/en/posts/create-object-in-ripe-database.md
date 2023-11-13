---
title: 'Creating Objects in RIPE DataBase'
author: "SteveYi"
date: Sat, 21 Nov 2020 08:37:20 +0000
draft: false
tags: ["ASN", "BGP", "Internet", "Routing Protocol"]
---

In this article, we will share with you how to register MAINTAINER, PERSON/ROLE, and ORGANIZATION objects in the RIPE DataBase.

These objects are also necessary to register ASN. If you want to apply for ASN, you can refer to [this tutorial](https://blog.steveyi.net/get-asn-from-ripe/).

First, we need to register for a RIPE account [registration website here](https://access.ripe.net/registration).

![](https://static-a1.steveyi.net/media/blog/2020112108155764.png)

After completing the registration, we enter the RIPE Database and click "Create an Object".

![](https://static-a1.steveyi.net/media/blog/2020112108175021.png)

Then we select the first "role and maintainer pair".

![](https://static-a1.steveyi.net/media/blog/2020112108190258.png)

Fill in the 'mnter' in the first field, which will be used as 'mnt-by'.
Enter any name in the 'role' field.
Write your home address in the 'address' field.
Enter your email address in the 'email' field.

![](https://static-a1.steveyi.net/media/blog/2020112108210139.png)

After registration, you will receive a 'role' and 'mnter', remember the primary key, we will use it later.

![](https://static-a1.steveyi.net/media/blog/2020112108240373.png)

After creating the object, we need to go back to the role and add an 'abuse-mailbox' complaint mailbox, which will be used in the ORG object.

![](https://static-a1.steveyi.net/media/blog/2020112108270350.png)

After completing this step, we return to the "Create an Object" step and select "Organisation".

![](https://static-a1.steveyi.net/media/blog/2020112108273384.png)

After completing this step, we click "Submit". We need to change the following fields:
"org-name": Enter your real English name (as on your passport)
"address": Address
"e-mail": Email address
"abuse-c": The role we created earlier
"mnt-ref": The mnter we created earlier

![](https://static-a1.steveyi.net/media/blog/2020112108330053.png)

After completing this step, we click "Submit" and we are done!

![](https://static-a1.steveyi.net/media/blog/2020112108331094.png)

Finally, we just need to give the ORG number to the LIR.

If you still don't understand, you can refer to the RIPE video! https://www.ripe.net/support/training/videos/ripe-database
