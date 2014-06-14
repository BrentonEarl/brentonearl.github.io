---
layout: post
title: Upgrade Debian Squeeze to Backports Kernel Version 3.2
date: 2012-02-20
category: Linux
description: "Debian Squeeze runs kernel 2.6.32.  An extremely stable Linux Kernel Release, but in my case, not so much.  This article discusses the process of upgrading to Linux Kernel version 3.2 using the Debian Backports mirrors."
comments: yes
---

 
Upon realizing there is a bug in my kernel suspend feature, which also seems to cause a kernel Stack errors, I decided to upgrade my Debian Squeeze Kernel from 2.6.32-5-amd64 to 3.2.0-0.bpo.1-amd64.  After completing this task, I figured I would share with the world how easy it is to get a newer kernel than what Debian Squeeze offers in the regular repos.  I used the Debian Backports repo to pull this newer kernel down.

**Step 1:**

-  Open up a root terminal.
-  Edit /etc/apt/sources.list
-  Append the Squeeze Backports

deb http://backports.debian.org/debian-backports squeeze-backports main contrib non-free

deb-src http://backports.debian.org/debian-backports squeeze-backports main contrib non-free

-  Update aptitude
-  aptitude update


**Step 2:**

There are quite a few different kernels available between the standard respositories and the backports repository.  What you will need to do next is assure you are installing the correct kernel by searching with aptitude for the correct name of the linux-image package.  After that you will want to also find the correct name for the linux-headers package so you can compile any kernel modules needed with the new kernel.  Once you have found the package names install them from backports.

- Open a root terminal
- Type: aptitude search linux-image-
- Copy the name of the kernel you wish to install
- Type: aptitude search linux-headers-
- Copy the linux-header name that matches your kernel version
- Next install the packages
In my case I chose linux-image 3.2 amd64.  So I would type and run the following in a root terminal:

- apt-get install -t squeeze-backports linux-image-2.6.39-bpo.2-amd64linux-headers-3.2.0-0.bpo.1-amd64




**Step 3:**

Now you are ready to reboot your system into the new kernel.  Upon reboot you will see a new entry in the Grub bootloader with your old kernel and your new kernel.  You should wait to remove the old kernel from your system. After you are sure that everything works in your new kernel you can remove the old one.  I have taken the approach of simply removing the old kernel entry from my grub menu, and leaving the old linux-image package installed on my system.

