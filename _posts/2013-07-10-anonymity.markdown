---
layout: post
title: Anonymity
date: 2013-07-10
category: Security
description: "How to become anonymous in the 21st century."
comments: yes
---

It is public knowledge that the NSA, among other Federal and State level agencies, have been monitoring Internet activity, voice, text and written digital communications.  I find it difficult to listen to the opinion of some people regarding this topic.  Some people say that they have nothing to hide, who cares if Big Brother is on the watch.  Others say they will not change a thing about their day to day habits.  A larger group of people are outraged and want to do everything they can to secure their digital habits and communications.  Freedom of speech is a fundamental part of being an American.  In this article I will outline what is being monitored, and how you can potentially become anonymous not only on the Internet or in your communications, but also out in the world.

###The Basics: Food, Gas, Clothes, Shopping


When we go to the store to buy food, clothes, or to the gas station, our every move is being monitored.  Department stores do studies on how consumers think and what they buy.  Gas Stations have cameras and keep consumer data as well.  Grocery stores take it to a similar level in order to attract consumers to their stores for the hottest deals.  Web sites like eBay or similar also use consumer tracking.  It is true that the data collected on individuals is likely to never be reviewed by law enforcement or the government. (Assuming you are not a fugitive or in some other volatile situation.)  

The simplest way to thwart consumer data collection is by using cash or pre-paid credit cards.  Pre-paid credit cards are a great option because you can load it up with your whole pay check each pay period and head out to make your purchases.  Pre-paid credit cards also work in conjunction with services like PayPal.  This is the easiest tep to take to to achieve anonymity.

###Communications


####Email

Email is used by everyone.  It is likely the single largest source of data collection conducted by Federal and State agencies.  Email addresses, the topics of discussion and even the location of the sender and addressee can be recorded with minimal effort.  In order to remain anonymous and still be able to send Email, there are a few things you can do.  All of which require some form of technical knowledge.

-  [GNUPG / OpenPGP](http://www.gnupg.org/)
-  [STARTTLS](http://en.wikipedia.org/wiki/STARTTLS)
-  Private Email Server

The easiest step to take is to start encrypting your emails using PGP encryption.  In order to implement PGP encryption on your Email you must create a PGP signed key.  Each key has a public version and a private version.  You need to share your public key with each person you plan to communicate via email to.  When other people wish to send you encrypted emails they just need to use your public key to encrypt the email.  When you receive said email, your private key will decrypt the message.  This works both ways.  If they also create a PGP signed key, encrypted messages can be sent both ways.

The drawback to PGP encrypted Emails is that the header information, the meta data if you will, of each email is still visible.  The meta data includes, the subject, who sent the email, who received it, where it was sent from, and where it ended up. PGP encrypted emails only encrypt the message body.

To take your email encryption a step further, you can use STARTTLS.  To use STARTTLS, the email server you send email from must have this option enabled.  It can be implemented for IMAP, POP3, and SMTP email protocols.  STARTTLS will hide the previously mentioned meta data in each sent and received email.

Now that your emails are all encrypted and very secure, its time to move on to the next step.

The last step to take is to create your own __private__ email server.  Companies like Google, Yahoo and Microsoft outlook are all subject to subpoena by government agencies.  Each year they hand over millions upon millions of communications that take place with the use of their "free" email accounts.  By running your own email server, it is guaranteed that a free email service will not be sharing your communications. 


####Phone calls

If you are the typical consumer and have purchased a cell phone from a large wireless company like Verizon or Sprint, you will have a lot of difficulty keeping your phone calls anonymous.  Just like Google, Microsoft and Yahoo, cell phone companies are also subject to subpoena.  When a large company like Verizon is issued a subpoena, they hand over massive amounts of consumer data.  Even if you have nothing to do with the reason the government is issuing this request, it is likely your information will be handed over as well.

There are a few ways to make anonymous phone calls.  All practical methods include using VoIP (voice over Internet protocol).  Other options include purchasing a pre-paid credit card with cash at a gas station or convenience store, and using this pre-paid credit card to buy a pre-paid cell phone.  Land lines, such as a phone plugged into the wall at your house, are impossible to keep anonymous.

[Encrypt VoIP Conversations](http://www.voipnow.org/2007/04/how_to_encrypt_.html)


####Text and Instant Messages

There are a number of ways to send anonymous text messages, but simply put, they are not end all solutions.  In addition,  the average person will not know how to implement said techniques.  The best option is to install an instant messenger client like Pidgin and use the plug-in called Off-the-Record.  There are other instant messenger clients that support similar behavior, but I personally enjoy using pidgin the most.  Pidgin supports nearly every text based communication protocol out there.  In order to use Pidgin you need to have Internet access.  I do not believe Pidgin is available for cell phones.

[Pidgin IM Web Site](http://www.pidgin.im/)      [Off-the-Record Plug-in](http://www.cypherpunks.ca/otr/)


###Web Browsing

Web browsing is by far the easiest to obfuscate, if you know a little bit about computer networking and Internet protocols.  I previously wrote an article covering a piece of software called "proxychains" which outlines a decent level of anonymity.  What I did not outline in that article was that you can take your proxychains configuration a step further and add the ability to chain your connections through TOR servers as well as other servers not on the TOR network.  Ideally it is best not to log into your bank account or your investment accounts over Proxied connections, due to the simple fact that anyone can be eavesdropping.

Normal web traffic on an Internet connection starts at one point, goes out the servers of an Internet service provider (comcast, cox, att, etc) and takes the shortest route to its destination.  Web traffic that uses proxies in conjunction with software like Proxychains and Tor looks something like this:

![Alt text](/assets/posts/Proxied_Network.png)

Essentially, your web traffic becomes extremely difficult to track.  If someone was to eavesdrop, it would be very difficult to keep track of all the data, unless they are on your local network.

[Tor Web Site](https://www.torproject.org/)      [Proxychains](http://exitstatusone.com/proxy-chains-anonymous-web-browsing/)

***
###Conclusion

In the age of Information Technology convenience is at its highest.  Staying in touch with friends, family, and co-workers are essential to keep up with the fast paced envrionment we live in today.  Everything is digitalized.  Coporations and Companies rely on today's technolgies to communicate.  All communications, whether we like it or not, cross public and private internet space.  The government makes no exception to how or when they eavesdrop or monitor American citizens, but there are some precautions we can take.  As we move forward each day it is important to protect your privacy and retain our rights to freedom of speech.
