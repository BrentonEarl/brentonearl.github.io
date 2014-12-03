---
layout: post
title: Creating a Minimal Debian Live System
date: 2012-02-29
category: Linux
description: "Learn how to create a basic live system image that can be booted from CD, DVD, USB or SDCard.  This article shows how easy it is to build a custom operating system specific to your individual needs."
comments: yes
---

In this article I will walk through the steps required to make a Minimal Debian Live CD.  I will show you how to add WiFi drivers, choose the kernel architecture, and add packages for each Live CD you are creating.  It is important to note that this is an introductory article on how to use the Debian Live live-build scripts.  [Live-build](http://packages.debian.org/squeeze/live-build) is the name of the package you will need to install in order to build Live CDs on your Debian operating system.  Another important fact to note is that I am using a Debian Squeeze system to build this Live CD.

**Installation Requirements from Debian Live Manual:**

1. Root Access
2. live-build
3. Bash or Dash
4. debootstrap or cdebootstrap
5. Optionally install live-manual


**Step 1:  Install live-build**

There are a number of different ways to install the live-build package.  You can choose to install from a snapshot, source code, or the Debian repository.  I will be using live-build version 2.0.12-2 from the Debian repositories.  Using the repositories is the easiest way to get your live cd creation off to a quick start.

- Install the live-build package

sudo aptitude install live-build


**Step 2: Install live-manual**

This tutorial covers only a small portion of the capabilities of the live-build package. If you wish to learn how to use live-build in full, you should consider installing the full documentation. This is an optional step, as you should be able to build a basic minimal Debian Live CD from this tutorial.

- Install the live-manual package

sudo aptitude install live-manual

**Step 3: Decide on a Build Directory**

t is important to decide on a clean target directory to build your live cd. We will be running live-build scripts that generate files and directories used to configure the build process of the final ISO image of your Live CD. If you do not choose a clean build directory, things could get a little messy and confusing.

__Good Locations:__

- Your user’s /home Directory
- Your user’s Desktop directory
- The /root folder
- The /tmp Directory

**Step 4: Configuration Options**

Here I will show and explain some of the configuration options used to generate your live-build directories. The command to invoke the scripts for live-build is the abbreviation lb. If you type in live-build and hit enter you will be presented with the man page for live-build. Configuration options are invoked using the command lb config, followed by each option.

__Configuration Options Used in this Tutorial__


-  –distribution
-  Used to select Debian distribution. ie. lenny, squeeze, wheezy, sid
-  –hostname
-  Sets the hostname of the resulting live cd system
-  –username
-  Sets the user name of the live cd user
-  –package-lists
-  Available options: debian-forensics, debian-live-devel, debian-live-pxe-server, debian-science, gnome, gnome-core, gnome-desktop, gnome-full, kde, kde-core, kde-desktop, kde-extra, kde-full, lxde, lxde-desktop, minimal, rescue, standard, standard-x11, xfce, xfce-desktop
-  –packages
-  Additonal packages
-  –archive-areas
-  Which sections of the debian mirror archive you will use
-  –apt-recommends
-  Sets if you will use recommended packages
-  –includes
-  Sets whether to include standard files from Debian live
-  –binary-indices
-  Saves space by leaving APT’s indices out of final ISO

You will need to open a terminal and execute the lb config command.  To execute a configuration with the above options of the lb command you will use the following format:

- sudo lb config –distribution squeeze –hostname exitstatusone –username alk3 –packages-lists minimal –packages “firmware-brcm80211″ –archive-areas “main contrib non-free” –apt-recommends false –includes none –binary-indices false

Note:  I included the additional package firmware-brcm80211 in my command because my system has a Broadcom 4313 Network card.  You will need to find the correct package name for your WiFi card and replace firmware-brcm80211 with the appropriate package.

**Step 5:**

You will notice that there were a number of files generated when you executed the lb config command.  Please note that editing these files manually can be done, but it is best that you run the lb config command to edit the files to avoid erroneous edits.

Now we will execute the _lb build_ command and watch as the terminal window flows downward while the build process commences.

- sudo lb build

The build process will take quite a while to execute and complete. If you are curious, by all means watch the whole process, but it may get boring. When the build process is complete you should end up with an ISO image in the root of your build directory.

For further reading please install the live-manual package. You can find the relevant documentation in /usr/share/doc/live-manual on your system after you install it.

References:

- [http://live.debian.net/](http://live.debian.net/)
- [http://packages.debian.org/squeeze/live-build](http://packages.debian.org/squeeze/live-build)
- [http://packages.debian.org/squeeze/live-manual](http://packages.debian.org/squeeze/live-manual)
