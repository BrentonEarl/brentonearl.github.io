---
layout: post
title: Broadcom 4313 WiFi Debian Linux
date:  2012-02-01
category: Linux
description: "Broadcom Wireless Cards are a pain to get working at times.  Short tutorial discussing how to get a Broadcom 4313 working under Debian."
comments: yes
---

**Background:**  Debian Linux does not come with working wireless card 
drivers for the BCM4313 Broadcom Wireless card.  Many laptops come with this wireless card, and I am sure many people have difficulty setting up WiFi on their Debian Linux Systems because of this.  In this article I will explain what I had to do to complete the installation of Debian Squeeze on my Dell Laptop.

**System Specs:**
-  Dell Inspiron 14R N4010
-  Intel(R) Core(TM) i3 CPU M 370 @ 2.40GHz
-  Broadcom Corporation BCM4313 802.11b/g/n Wireless LAN Controller
-  Debian 6.0.3 Squeeze, Linux 2.6.32-5-amd64

**Step 1:**

The first step is to verify your systems hardware, kernel version and operating system version.  This tutorial is focused on Linux users running Debian.

1.  Open a Terminal
2.  Type and Execute:  uname -a
3.  Type and Execute:  cat /etc/debian_version
4.  Type and Execute:  lspci -v | grep "Network controller"
5.  These commands will show your kernel version, your Debian operating system version, and the name and model of your Network Controller.

**Step 2:**

Next we will need to verify you have the right software sources.  In a regular installation of Debian Squeeze your sources.list should have the correct software sources by default.  This is just a precaution to guarantee that you can install the necessary software.

-  deb http://ftp.us.debian.org/debian squeeze main contrib non-free
-  The above software source should be located somewhere in your sources.list
-  sources.list can be found at /etc/apt/sources.list

**Step 3:**

Here we will install the BCM4313 firmware necessary to deem your WiFi card operational.  We will also install the necessary software dependencies to configure your wireless card settings after the firmware is functional.  We will be installing the brcm80211 firmware, wireless-tools, Wpa_supplicant, and wicd network manager.

-  Open a Terminal
-  Type and Execute:  aptitude install brcm80211 wireless-tools
-  Next, Type and Execute:  aptitude install wpasupplicant wicd
-  You should now have the firmware, tool extensions to manage wireless settings, Wpa_supplicant (client support for WPA and WPA2), and the Wicd Network manager.

**Step 4:**

The next step is to unload and reload your firmware drivers to guarantee that the brcm80211 kernel module has recognized your Network Card.

1.  Open a Terminal
2.  Switch to the root user
3.  Type and Execute:  modprobe -r brcm80211
4.  Type and Execute:  modprobe brcm80211
-  From the man page:  modprobe - program to add and remove modules from the Linux Kernel
-  Your kernel should now recognize your WiFi card

**Step 5:**

Next we will configure your system user to have the proper permissions to run wicd in the netdev group (as required for Wicd to operate correctly).

1.  Open a Terminal
2.  Switch to the root user
3.  Type and Execute:  adduser __yourusername __netdev
4.  Next we will reload the system message bus daemon (dbus)
5.  In your Root Terminal, Type and Execute:  /etc/init.d/dbus reload


- __Please be sure to enter your system user name for the command in #3.__
- __Please be sure you are executing these commands as the root user__
- __Without root permissions you will not be allowed to execute these command__

**Step 6:**

Finally, we will start the Wicd network daemon and execute the GUI Client.  With Wicd you should be able to configure and bring up your WiFi card without much hassle.

1.  Open a Terminal
2.  Switch to the root user
3.  Type and Execute:  /etc/init.d/wicd start
4.  Switch to your system user by Typing and Executing:  exit
5.  As your normal user, Type and Execute:  wicd-client -n
6.  You will see Wicd Network Manager start up and list an ESSID List
7.  The GUI window will open and you should be good to go.

**References:**

-  Debian brcm80211:
-  http://wiki.debian.org/brcm80211
-  Wicd Network Manager:
-  http://en.wikipedia.org/wiki/Wicd
-  How To Use Wicd:
-  http://wiki.debian.org/WiFi/HowToUse#Wicd
-  Wpa_Supplicant:
-  http://en.wikipedia.org/wiki/Wpa_supplicant
-  How To Use and Configure wpa_supplicant:
-  http://wiki.debian.org/WiFi/HowToUse#wpa_supplicant

