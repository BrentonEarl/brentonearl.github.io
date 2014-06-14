---
layout: post
title: Cisco - Basic Router Configuration
date: 2012-03-03
category: Cisco
description: "Covers the basics of Cisco Router configuration and deployment."
comments: yes
---

In this article I will be walking my readers through a quick tutorial on Basic Cisco Router configuration.  We will be setting the hostname, the priviledged exec mode password, the global configuration mode password, the console password, and the virtual terminal password.  This should give the reader a basic start to getting a Cisco router up and running. __It is important to note that I am executing this tutorial with the use of the Packet Tracer program created by Cisco.__

**Step 1:**

Boot up your router.  Enter your router console through either a hyperterminal or a serial console session.  The first thing you should see on the screen is:

Continue with configuration dialog? [yes/no]: no

Press RETURN to get started!

Enter the word no.  As we want to configure the router ourselves without prompts, for learning purposes.  Hit enter.  The next thing you will see is your router prompt.  Type and Execute the following command: enable.  This will drop you into priviledged exec mode.

Router> enable

Next Type and Execute configure terminal.  This command will drop you into global configuration mode where we will configure the router’s passwords and hostname.

Router# configure terminal

Now that we are in global configuration mode (deciphered by the # symbol) we can move to the next command.  Type and Execute hostname MyRouter and you should see your router prompt change.

![Alt text](/assets/posts/CISCO_Set_Hostname.png)


**Step 2:**

We have successfully configured the hostname of our router.  The next step is to configure the priviledged exec mode and global configuration mode passwords.  To start make sure we you are in global configuration mode.  We will be using the password “cisco” for priviledged exec mode.  We will be using the password “class” for global configuration mode.  Set the password for priviledged exec mode by Typing and Executing __enable password cisco__.  Next set the password for global configuration mode by Typing and Executing __enable secret class__.

![Alt text](/assets/posts/CIsco_Set_Priv_Global_Passwords.png)

**Step 3:**

In this step we will set the password for the serial console on router __MyRouter__.  In global configuration mode, Type and Execute __line console 0__.  Following that, Type and Execute __password cisco__.  Then Type and Execute __login__.  You have just set the serial console password on your router.

![Alt text](/assets/posts/Set_console_Password.png)

**Step 4:**

I will now show you how to set the password for the virtual terminals.  In global configuration mode, Type and Execute __line vty 0 4__.  This tells the router that you wish to configure virtual terminals zero through four. Next, Type and Execute __password cisco__.  Following that, Type and Execute __login__.  Your password is now set.

![Alt text](/assets/posts/Set_vty_passwords.png)

**Step 5:**

The last and Final step to this tutorial.  Now that you have set all of the passwords and the hostname on your Router, you need to save your work.  In priviledged exec mode, Type and Execute __copy running-config startup-config__ and hit enter when it prompts for the file name.  This command will copy your live configuration to nvram on the router.  By doing this you are allowing the router to use your configuration as its default configuration.  It also protects your router from losing its configuration if it is powered off and back on.


![Alt text](/assets/posts/Cisco_Copy_Run_start.png)

This concludes the tutorial.  If you have any questions or comments, please send me an email and I will do my best to answer your question.
