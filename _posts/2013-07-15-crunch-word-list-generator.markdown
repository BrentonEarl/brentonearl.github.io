---
layout: post
title: Crunch Word List Generator
date: 2013-07-15
category: Security
description: "Learn how to generate lists of words, numbers and mixed combinations using Crunch.  Great if you need assistance creating a very long and comprehensive password list."
comments: yes
---

[Crunch](http://sourceforge.net/projects/crunch-wordlist/) is a word list generator with a lot of functionality to create diverse word lists for a variety of tasks.  The most common task is to generate a list of passwords and user names used to test the strength of log in credentials for services that require a user to log in.  It has the ability to generate word lists based on a few different switches.

####Minimum and Maximum Length

The first set of switches you will need to give crunch are the minimum and maximum lengths of your desired word list.  For example, a word list that requires a minimum word length of 3 and a maximum word length of 9, you would need to specify the following:

-  crunch 3 9 <other switches>

####List Pattern

Once you have decided the length of the included words you need to specify a pattern.  This can be done using a pattern as simple as abcdef or a complex regular expression.  Example:

- crunch 3 9 abdcef <other switches>

####Output File

Finally, to save the generated words to a file you need to determine where you would like to save your list.  It is important to save your generated file to a location on your hard disk that has ample space to store large files.  Generated files can be, and are usually, in sizes of GigaBytes.

- crunch 3 9  abdcef -o wordlist.txt

***
Video Example:

{% include crunch.markdown %}
