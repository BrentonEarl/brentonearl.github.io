---
layout: post
title: Install Cisco Packet Tracer on Debian 64 bit
date: 2012-02-15
category: Cisco
description: "Cisco Packet Tracer is software that allows students and professionals to create a virtual environment of Cisco network devices on a variety of networks.  This article discusses the process of installing Cisco Packet Tracer within a 64 bit Debian Linux System."
comments: yes
outdated: yes
---

I am taking a class that requires me to use Cisco's Packet Tracer to do labs.  I grew tired of being forced to boot into Windows 7 to do class work, as I would rather stay using Linux for all of my needs.  After trying to install the Windows .exe in wine and receiving errors, and shortly after a crash, I found: [Installing Cisco Packet Tracer 5.3 in Ubuntu](http://www.ubuntubuzz.com/2011/05/installing-and-running-cisco-packet.html).  This tutorial, however, did not meet 100% of my needs.  I am running Debian Squeeze on AMD64, so the binary package gave the error after the EULA:

> Attempting to install package now
> dpkg: error processing PacketTracer-5.3-u.i386.deb (--install):
> package architecture (i386) does not match system (amd64)
> Errors were encountered while processing:
> PacketTracer-5.3-u.i386.deb

After searching around on the web I came to find a solution to installing this package on a 64bit system.  I first installed ia32-libs and ia32-libs-gtk, but I am unsure this was necessary for packet tracer to run.  After that I had to do a bit of a hack to get the .deb package out of the .bin installer to bypass the dpkg architecture error.

First I ran:
    chmod +x PacketTracer53_i386_installer-deb.bin
    sudo ./PacketTracer53_i386_installer-deb.bin

Next, the tricky part.  Leave the .bin running at the EULA.  Then go to a new terminal window and head over to /tmp/selfextract.XXXX.  The self extract directory will have a different ending where the XXXX portion of the directory name is labeled.  Notice that after executing 'ls' you will see the eula, installer, and the .deb package.  Copy the whole directory to some place in your user's home directory.

    user@exitstatusone~# sudo su
    root@exitstatusone:/tmp# cd selfextract.2zDwDM/
    root@exitstatusone:/tmp/selfextract.2zDwDM# ls eula.txt  installer  PacketTracer-5.3-u.i386.deb
    user@exitstatusone:/tmp/selfextract.2zDwDM# cp * /home/user/Cisco_Packet_Tracer/debian_package

From here you can exit the .bin installer and close that terminal window.  Head into the directory that contains the .deb package.  You will now need to install the package with the --force-all option.

    user@exitstatusone:~/Cisco_Packet_Tracer/debian_package$ sudo dpkg -i --force-all PacketTracer-5.3-u.i386.deb
    [sudo] password for user:
    dpkg: warning: overriding problem because --force enabled:
    package architecture (i386) does not match system (amd64)
    Selecting previously deselected package packettracer.
    (Reading database ... 134888 files and directories currently installed.)
    Unpacking packettracer (from PacketTracer-5.3-u.i386.deb) ...
    Setting up packettracer (5.3) ...
    Installed files. Please wait for post-install operations to finish..
    gtk-update-icon-cache: Cache file created successfully.
    Writing PT5HOME environment variable to /etc/profile
    Processing triggers for man-db ...
    Processing triggers for gnome-icon-theme ...


Next you will need to create a symlink from /usr/local/PacketTracer5/packettracer to /usr/local/bin to allow the Packet Tracer binary into your user's $PATH.

    user@exitstatusone:~/Cisco_Packet_Tracer/debian_package$ sudo ln -s /usr/local/PacketTracer5/packettracer /usr/local/bin

After you have installed the .deb package and created the symlink you can execute the "packettracer" binary from your user's shell prompt.

    user@exitstatusone:~/Cisco_Packet_Tracer/debian_package$ bash packettracer
    Starting Packet Tracer 5.3

Profit!  You should now see a window similar to this:

![Alt text](/assets/posts/Screenshot-Cisco-Packet-Tracer.png)

I have not tested the software for bugs in Linux, but as far as I can tell Packet Tracer runs just fine in Debian Squeeze AMD64.  I will have to report back if at some point the software starts to crash.
