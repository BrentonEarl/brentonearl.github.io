---
layout: post
title: How to Jailbreak Droid 2 Global
date: 2013-06-22
category: Android
description: "Learn how to jail break your Android Droid 2 Global."
comments: yes
---

In this article I will discuss the process of Jail breaking / rooting a Droid 2 Global.  This process should work on newer versions of the Motorola Droid as well.  I will explain how to gain root access using a Terminal Emulator from the Google Play Store.  Gaining root access to a smart phone allows the user to unlock the full capability of the phone and the installed Operating System.

****Important:  You must have significant knowledge on how to use Linux and a good understanding of how your Android device functions in order to complete this tutorial.  I am not responsible if you “brick” your phone.****

Phone Specifications:

-  System Version: 4.5.629.A956.Verizon.en.US
-  Model Number: Droid2 Global
-  Android Version: 2.3.4
-  Kernel Version: 2.6.32.9

In order to jail break / root my phone I used an application called Framaroot 1.4.2.  This app is not included in the Google Play store.  To install non-Market apps you need to go to your application settings on your phone and check the box for “Unknown Sources”.  Once that is completed you can then head over [Here](http://forum.xda-developers.com/showthread.php?t=2130276) and download Framaroot 1.4.2 at the bottom of the post.  You can do this in Windows or in Linux.

Install Framaroot 1.4.2 and root phone:

-  Connect your phone to your laptop and set the USB connection so that “USB Mass Storage” is selected.
-  Copy Framaroot-1.4.2.apk to your phone sdcard
-  Open your phone file manager and touch the Framaroot-1.4.2.apk
-  Your Android package installer should pop up and install the app, follow the prompts.
-  Once the application is installed go to the drop down menu and select “Install Superuser” and then select exploit “Gimli”.
-  Your phone should now be rooted and ready to install Busybox.

Once you have installed Framaroot and rooted your phone you will need to install the “Busybox Installer” app.  The “Busybox Installer” application can be found in the Google Play store, install it.  You will need to run a few scripts once it is installed.  After you have installed Busybox, go to the Google Play store and install an app called “Android Terminal Emulator”.  There are many other terminal emulators on the App market, choose the one you like the most.  After you have installed your terminal emulator open it and log in as root to verify you can access the root shell.  Here is a step by step walk through on installing Busybox, Android Terminal Emulator, and changing to the super user (root) on your android phone:

Install Busybox 1.2.0, Android Terminal Emulator, and change to super user:

-  Download, install Busybox, and open Busybox
-  Select Busybox version 1.2.0 and Install Location /system/xbin
-  Check Symlink applets and leave Advanced Install unchecked, then Click install.
-  Once again go to the Select Busybox Version drop down and select zipalign
-  Check Symlink applets and leave Advanced Install unchecked, then Click install.
-  Once Busybox is installed, move right in the Busybox app to the Scripter section.
-  Run Scripts: Fix Permissions, Mount System R/W, Zipalign Apks
-  Exit the Busybox app
-  Install Android Terminal Emulator from the Google Play app store and open it
-  Type “su” and hit enter


You now have root level permissions on your Android Phone.
