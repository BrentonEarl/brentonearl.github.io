---
layout: post
title: Install Debian on Droid 2 Global A956
date: 2013-06-22
category: Android
description: "Learn to install Debian Linux on your Android."
comments: yes
---

In this article I will walk through the process of bootstrapping Debian Linux with the armel architecture and “booting up” the image on an Android Operating System.  It works by telling the Android OS where the image is at and then executing the appropriate commands to attach to the image and chroot into a Bash shell as root.

****Important:  You must have significant knowledge on how to use Linux, program in Bash, and a good understanding of how your Android device functions in order to complete this tutorial.  I am not responsible if you “brick” your phone.****

Phone Specifications:

- System Version: 4.5.629.A956.Verizon.en.US
- Model Number: Droid2 Global
- Android Version: 2.3.4
- Kernel Version: 2.6.32.9

Prerequisites:

- Your Phone Must be rooted
- You must have Busybox installed on your phone
- You must have a terminal emulator installed on your phone

Additionally, it is recommended that you complete this tutorial from a Debian installed laptop or desktop for simplicity.  I installed Debian on my phone using a Debian Wheezy install on my laptop.  Knowledge of Bash Scripting is recommended.

**Video tutorial below, or scroll down to continue reading.**

{% include android_debian.markdown %}

The first step is to build a 2GB Debian image which we will later on use to boot Debian on your Android phone.  After that you will need to prepare a boot script to boot into Debian on your phone.  Next you will need to install the Android SDK so you can access your phone from a laptop in Linux.  Finally you will execute the boot script for Debian and enter the chroot environment, finish installing the Debian base system, update your repository information for apt, and update your system.

**Step 1: Create a Debian Image**

Creating the image file

1.  Log onto your Debian installed Laptop/Desktop, open a terminal and log in as root
2.  Run: “apt-get install debootstrap”
3.  Create the 2GB Debian image by running

- dd if=/dev/zero of=debian.img bs=1024 count=2M

Next, create an ext3 file system within the debian.img file you just created:

- mkfs -t ext3 -F debian.img

Next we will debootstrap a base system into debian.img by executing the following:

1.  cd /root
2.  mkdir debian/
3.  mount -o loop debian.img debian/
4.  debootstrap –verbose –arch armel –foreign wheezy debian http://ftp.us.debian.org/debian
5.  unmount debian/
6.  rm -r debian/

Now debian.img is ready for a first boot.  On to the next step.


**Step 2: Creating the boot script**

I named my Debian boot script “bootdebian”.  You can name it whatever you like, just remember the name because it will be the command you execute as “su” on your Android once everything is in place.

{% highlight bash %}

#!/bin/bash

echo “=========================”
echo “=========================”
echo ” Booting Debian”
echo “=========================”
echo “=========================”

echo “Mounting Droid Internal Drive as Read/Write”
mount -o remount,rw -t yaffs2 /dev/block/mmcblk1p21 /system
echo ; sleep 1
echo “Droid Internal Drive Mounted at”
mount | grep /system
echo ; sleep 1
echo “Setting Environmental Variables”
export bin=/system/bin
export img=/mnt/sdcard/debian.img
export mnt=/data/local/debian
export PATH=$bin:/usr/bin:/usr/sbin:/bin:$PATH
export TERM=linux
export HOME=/root
echo ;sleep 1

echo “Verifying /data/local/debian exists.”
echo ;sleep 1
if [ ! -d $mnt ]
then
echo “Creating /data/local/debian.”
mkdir $mnt
fi
echo ;sleep 1

echo “Mounting the Linux Image”
if [ -b "/dev/block/loop99" ]
then
echo “Loop device exists, removing loop99″
losetup -d /dev/block/loop99
echo ;sleep 1
fi
echo
echo “Running mknod /dev/block/loop99 b 7 99″
mknod /dev/block/loop99 b 7 99
echo ; sleep 1

echo “Running losetup /dev/block/loop99 /mnt/sdcard/debian.img”
losetup /dev/block/loop99 $img
echo ; sleep 1

echo “Mounting loop99″
mount -t ext3 -o noatime,nodiratime /dev/block/loop99 $mnt

echo “Mounting devpts”
mount -t devpts devpts $mnt/dev/pts

echo “Mounting proc”
mount -t proc proc $mnt/proc

echo “Mounting sysfs”
mount -t sysfs sysfs $mnt/sys
echo ; sleep 1

echo “Setting Up Networking”
sysctl -w net.ipv4.ip_forward=1
echo ; sleep 1

echo “Adding Nameserver 8.8.8.8 and 8.8.4.4″
echo “nameserver 8.8.8.8″ > $mnt/etc/resolv.conf;
echo “nameserver 8.8.4.4″ >> $mnt/etc/resolv.conf
echo “Adding 127.0.0.1 localhost to hosts file”
echo “127.0.0.1 localhost” > $mnt/etc/hosts
echo ; sleep 1

echo “Mounting sdcard in /mnt”
if [ ! -d $mnt/mnt/sdcard ]
then
mkdir $mnt/mnt/sdcard
fi
busybox mount –bind /mnt/sdcard/ $mnt/mnt/sdcard

echo “Executing chroot for Debian System”
echo
chroot $mnt /bin/bash

echo
echo “Shutting Down Debian”
echo ; sleep 1
echo “Unmounting sdcard”
umount $mnt/mnt/sdcard
echo “Restoring ipv4″
sysctl -w net.ipv4.ip_forward=0
echo “Unmounting pts”
umount $mnt/dev/pts
echo “Unmounting proc”
umount $mnt/proc
echo “Unmounting sys”
umount $mnt/sys
echo “Unmounting /data/local/debian”
umount $mnt
echo “Removing /dev/block/loop99″
losetup -d /dev/block/loop99
echo “Remounting /system Read Only”
mount -o remount,ro -t yaffs2 /dev/block/mmcblk1p21 /system
{% endhighlight %}


What this script does:

1.  Mounts your internal android storage device as read / write
2.  Creates directory “/data/local/debian” on your android device
3.  Creates block device /dev/block/loop99 and mounts it as a ext3 file system
4.  Mounts proc, sysfs, devpts
5.  Sets up IPV4 forwarding, sets the name servers, and creates the hosts file
6.  Mounts the sdcard
7.  Executes the chroot
8.  Once you are finished doing whatever it is you do in Debian, hit exit at the shell prompt and then the script will continue to run
9.  The final portion of the script unmounts file systems used by debian.img, removed /dev/block/loop99 and remounts your android internal disk as read only

What you will need to modify so that the script will run on YOUR android phone:

1.  First off find out where your internal file system is mounted at by running: “mount | grep /system”  in your busybox terminal emulator
2.  Second edit the bootdebian script so that it will remount the internal disk as read / write at the beginning of the script and read only at the end of the script
3.  Now, /bin/bash does not exist within the busybox installation on your android device
4.  You will need to create a symlink from /system/bin/sh to /bin/bash.  You will need to create the /bin directory prior to creating the symlink.  You will need to mount the root files system on your android device with write priviledges:  mount -wo remount rootfs /
5.  Once you have created the symlink, the boot script will be able to execute a bash shell (sh) upon executing the chroot command to enter the debian install

At this point you might be thinking:  ”Great, I have the Debian image created and a boot script to boot up Debian.  How do I get these two files onto my android phone in order to boot up my new OS?”

**Step 3:  Install the Android SDK, boot script, and debian.img**

In this step I will walk you through installing the Android SDK on your Debian Linux Laptop or Desktop.

1.  Download the Android SDK (ADT Bundle for Linux) from:  http://developer.android.com/sdk/index.html
2.  Create a directory in your home folder, I used /home/user/Projects, then extract the SDK into that directory
3.  Change to the adt-bundle-linux-xx-xxxxx directory where xx is your platform and xxxxx is the version of your adt bundle directory.  Then change directory to sdk/platform-tools
4.  Assure your Android phone is connected to your USB port and that the USB connection on your phone is set to “Charge Only”
5.  Execute: sudo ./adb devices
6.  You should see that your device is recognized
7.  Next execute sudo ./adb shell
8.  If you received a shell prompt with a “$” you are logged on to your android device,  type “exit”.
9.  Next we will be pushing files onto your phone using the adb program.
10.  To upload the boot script, Execute:  sudo ./adb push /local/path/to/bootdebian /sdcard/bootdebian
11.  To upload the debian.img file, Execute:  sudo ./adb push /local/path/to/debian.img /sdcard/debian.img
12.  Next execute:  sudo ./adb shell
13.  Type: “mount | grep /system”  and make note of what /dev/block file your internal hard disk is mounted to
14.  Then, Execute the following commands while replacing /dev/block/mmcblk1p21 with the appropriate /dev/block file on your device:


- mount -o remount,rw -t yaffs2 /dev/block/mmcblk1p21 /system
- mount -wo remount rootfs /
- cp /sdcard/bootdebian /system/xbin/bootdebian
- chmod 777 /system/xbin/bootdebian
- mount -ro remount rootfs /
- exit

Phew, all files are now copied and ready to be ran!


**Step 4: Finishing up**

In this portion of the guide you will be executing your boot script (bootdebian) for the first time.  Once you are in the chroot environment you will need to finish up the Debian installation.

This step can either be done directly on your phone, or by using the adb command on your laptop.  I chose to do it from my laptop.


Execute from the android sdk platform-tools directory:
- sudo ./adb shell


Run boot script on your Android phone:
- bootdebian

Once the script has ran you should see the Debian command prompt:

- root@localhost:/#

Next portion is installing the rest of the Debian Wheezy base system.  You will have all the essential programs required to run a very basic Linux installation.  Once you have completed your installation you can then start searching for software in the Debian repositories to install on your device.


1.  Run:  /debootstrap/debootstrap –second-stage
2.  This will take a bit to run, since it is using your Android’s hardware.  Took me about 5 minutes
3.  Run:  echo ‘deb http://ftp.us.debian.org/debian wheezy main’ > /etc/apt/sources.list
4.  Clean up your system with:  apt-get autoclean
5.  Update your package list:  apt-get update
6.  At this point you can start customizing your installation by setting the hostname, creating user accounts, securing the system… etc. etc. etc.

**Toubleshooting your first log in**

If you see at your command prompt:

-  I have no name!@localhost:/#

You will need to make sure the permissions for /etc/passwd are 644:

-  chmod 644 /etc/passwd

After you reboot into your debian installation using the bootdebian script, this issue should be fixed.

Credit should be given to MRLANRAT @ lanrat.com.  His guide (http://lanrat.com/install-debian-on-android/) was a big help.  I had to modify a lot of the information in his tutorial because it is out dated.  I also had to rewrite the bootdebian boot script because it did not work on my Droid 2 Global.  However, he should be credited all the same.
