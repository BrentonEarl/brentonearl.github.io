---
layout: post
title: "Cloud Based Storage:  Is it really the best data storage solution?"
date: 2013-07-09
category: Software
description: "Article discussing the pros and cons of cloud based storage, specifically highlighting the recent news for Dropbox."
comments: yes
---

On July 9th, 2013 Dropbox is having it's first Developer's Conference for a day of creativity and exploration.  This conference aims to inform various developers of latest releases and the capabilities of the Dropbox platform.  One of the topics that will be discussed is how Dropbox plans to develop the Dropbox API to completely replace hard drives and integrate their system into an operating system.

Dropbox is great for systems of all types.  If you do not already have a cloud based system in your company, or you simply need a place to back up important documents as a home user, it is an awesome solution.  Yes, their are competitors out there like Google Drive and others.  With the recent developments of the Dropbox platform, this product is gaining the upper hand on other cloud based sotrage system.  Dropbox has the ability to keep structured data in sync, allow users to work offline, handle data conflicts, and be platform independent.  

The features included in the whole of the Dropbox API are the Sync API, Datastore API, and Drop-Ins.  Combined, each portion handles caching, network flakiness, syncing of data, files, to do items, contacts and game states.  Additionally the Drop-Ins portion includes a Cross Platform user interface that can be integrated in minutes.  With over 100 million users, Dropbox is becoming a major competitor in Cloud based storage.


*****
My thoughts on Cloud Based Storage
===================================

All other 3rd party cloud based solutions aside... Dropbox alone is an inherent security risk, serving approximately 100 million users.

Cloud based storage is not a new thing.  For decades IT professionals have integrated infrastructure at companies and coporations in a variety of ways.  Some methods are secure, others less secure, but generally cloud based storage is risky.  It is one thing to back up your data to a secure location.  Outsourcing data back ups, document and records storage is an inherant security risk in itself.  Not to mention the added overhead required to manage cloud based servers.

__Data interception__

1.   All traffic that crosses the wires within a local area network is far more secure than that which is sent over public internet space for all to eavesdrop.
2.   Provided that said data is encrypted, it is still possible to implement session hijacking using a MITM attack to intercept the data prior to it reaching its destination.

__Cloud Servers__

1. Servers are compromised every day, all types.  Why would anyone think that storing such sensitive data on a remote server is secure?
2.  Typically companies and corporations have very secure networks.  Financial Institutions are required to follow PCI-DSS standards.  Why would anyone want to increase security risks by outsourcing data storage where a 3rd party may or may not be as secure as an in-house network?

__Data loss__

1.  All Data should be backed up locally and remotely.  However, 3rd party cloud based solutions are not the answer.  Creating a company controlled cloud server on a controlled WAN, implemented by IT staff is far safer.
2.  National and International companies have the ability to implement a more secure WAN if cloud servers are _only_ on the WAN.  Sending data every which way increases inherent risk of data loss due to outages or power failures on external servers.

In conclusion, I feel that in-house cloud based solutions are the best choice.  Ease of use and convenience are not always the answer when it comes to data management.  Typically cloud based storage is outsourced to a 3rd party, forcing clients to become dependant on said 3rd parties.  More importantly, the internet has been one large cloud since the beginning, where people store data every which way.  I am unsure what the hype is about "Cloud Based Storage" when the concept has been implemented for decades.  I assume it is just the latest and greatest thing that seems like a good idea, until that one time large amounts of data are compromised and the popularity of outsourcing data storage diminishes.
