---
title: 'Applying for your own ASN through RIPE'
author: "SteveYi"
date: Sat, 21 Nov 2020 08:39:28 +0000
draft: false
tags: ['ASN', 'BGP', 'Internet', 'Routing Protocol']
---

Today we will talk about how to obtain your own ASN through LIR in RIPE.

First of all, some people may wonder:

**Why choose RIPE? Isn't APNIC or ARIN a good choice?**

The author has two ASNs, one under RIPE and the other under APNIC. 
When the author makes changes to some whois information, RIPE allows direct web access to make changes, while APNIC requires sending emails... which is more troublesome (actually it's about the same).

However, there are differences between the two management organizations, RIPE requires verification of real identities (individual applications require sending passports or other identification documents), while APNIC does not require any identification documents.

So, let's get started with the application process.

**Find an LIR (sponsor)**
==============

First, we need to find an RIPE member (LIR) to be our sponsor.
We just need to search for "Lir Service" on Google and we will see many related services.

![](https://static-a1.steveyi.net/media/blog/2020111814292492.png)

The author has tried the service of [Openfactory](https://freetransit.ch/) and highly recommends it! (although it's a bit slow)

**Prepare application materials**
==========

After we find an LIR and contact them through email or other channels, we can prepare the application materials.
According to the author's experience, most LIRs require these things (because they need to be submitted to RIPE):

Real English name (First + Last name), the name on the passport
Postal address (real address)
Copy/scan of passport (sometimes ID photo may be required)

Then we need two peers, which are also called "Peer Partner" in our common language.
If you don't mind, you can directly fill in my information:

AS60614(TSUNGYI YU)
peering_at_steveyi.net

AS209557(TSUNGYI YU)
peering_at_steveyi.net

Since we are applying through RIPE, we also need to prepare some object records: MAINTAINER, PERSON/ROLE, and ORGANIZATION object. 
The "org-name" in the ORG object must be the real name (passport name).
For the application process and method, you can refer to [this article](https://blog.steveyi.net/create-object-in-ripe-database/).

After everything is ready, the LIR will prepare a user agreement, which, after signing, will be forwarded to RIPE for your request!
When submitting the request to RIPE, ASN will be issued in about 1-3 days.

After getting the ASN, we can start broadcasting our network!
In the next article, we will share with you the details of broadcasting the network.
