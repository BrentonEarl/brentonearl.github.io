---
layout: post
title: Debian Backports - Upgrade Iceweasel to a Newer Version
date: 2012-03-03
category: Linux
description:  "Explanation of how to upgrade Iceweasel (Firefox) using the Debian Backport mirrors.  Good example of how to use the Debian Backports for any other type of software upgrade, in any release of Debian."
comments: yes
outdated: yes
---

In this article I will be discussing for my viewers how to upgrade Iceweasel (Iceweasel is Debian’s Mozilla Firefox package) from version 3.5.16-12 to version 10.0.2-1 on Debian Squeeze.  Like many, I get complaints from Gmail or Google Apps stating that my browser is old and I need a newer version of Firefox to gain all of Google’s site features.  Basically this tutorial will give you a more recent version of Mozilla Firefox so that you can have more modern web browsing on your Debian System.  We will be using a combination of repository sources to complete this task.

**Step 1:**

First you need to edit your repositories.  I like to do this using a terminal window and vim.  You can also use gedit, nano, or any other text editor to do this.  You will need to have sudo or root (su) privileges.

- sudo vim /etc/apt/sources.list


Add the following lines to your sources.list file and save your work.


- deb http://backports.debian.org/debian-backports squeeze-backports main contrib non-free
- deb http://mozilla.debian.net/ squeeze-backports iceweasel-release


**Step 2:**

Next you will need to update apt or aptitude’s indices.  Do this by running an sudo apt-get update or sudo aptitude update.  You will see apt/aptitude do its thing, resulting in a complaint stating you do not have the repository archive key for the mozilla debian repository.  You can fix this by installing the package pkg-mozilla-archive-keyring.

- sudo aptitude update
- sudo aptitude install pkg-mozilla-archive-keyring

**Step 3:**

Finally you will be installing the newer version of Iceweasel, version 10.0.2-1.  Do this by running sudo aptitude install -t squeeze-backports iceweasel.  You should now have the newest version of Iceweasel on your system.

- sudo aptitude install -t squeeze-backports iceweasel

This completes this tutorial on upgrading Iceweasel on your Debian Squeeze System.  As always, please send an email with questions or concerns.  I will do my best to answer your questions.




