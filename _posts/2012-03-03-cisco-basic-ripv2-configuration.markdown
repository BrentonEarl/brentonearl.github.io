---
layout: post
title Cisco: Basic RIPv2 Configuration
date: 2012-03-03
category: Cisco
description: "Covers the rudimentary process of configuring a Cisco Router to run the RipV2 routing protocol."
comments: yes
---

In this article I will be walking my readers through the process of configuring a Cisco router to use the RIPv2 routing protocol.  RIP, or Routing Information Protocol, is a distance vector protocol that employs the hop count as a routing metric.  The maximum allowable hops for RIP is 15 hops.  For more information on RIP or RIPv2, please read RFC 1058, 1388, 2453, 2082, 4822, and 2080.  Wikipedia also has a great article covering RIP and RIPv2 in great detail: [Wikipedia: Routing Information Protocol](http://en.wikipedia.org/wiki/Routing_Information_Protocol)

In my configuration I will be deploying one router, one switch and two workstations.  I will configure the router with the RIPv2 routing protocol.  I will be using a CIDR Value of /24 with class C network 192.168.0.0.  The switch will be left at default configuration, so it will forward all packets. __It is important to note that I am executing this tutorial with the use of the Packet Tracer program created by Cisco.__

**Network Diagram:**

![Alt text](/assets/posts/Switch_Router_2_WorkStations_ClassC.png)

Please refer to the article Cisco: Basic Router Configuration if you need help getting the basic settings on your router.  Also, please view the article Dia – The Diagram Creation Program  for some insight as to how I created my network diagram.

**Step 1:**

Assuming you have already configured the basics of your configuration, we will begin by setting the IP Address on the Main Router.  First, Type and Execute __interface fa0/0__.  Second, Type and Execute __ip address 192.168.0.1 255.255.255.0__.  Finally, bring the interface up by Typing and Executing __no shutdown__ _or_ __no shut__.

![Alt text](/assets/posts/Cisco_Set_IP_Address.png)

**Step 2:**

The next step will be to enable RIPv2 or Routing Information Protocol Version 2.  Make sure you enter global configuration mode by Typing and Executing __configure terminal__.  At the global configuration mode prompt Type and Execute __router rip__. Next, Type and Execute __version 2__.  Finally, exit by Typing and Executing __exit__.  Your router should now be running RIPv2 routing protocol.

![Alt text](/assets/posts/Cisco_Enable_RIPv2.png)

**Step 3:**

Remember to save your work.  Do this by Typing and Executing __copy running-config startup-config__.  Your work is saved now.  In Packet Tracer you should be able to ping from the router to each workstation, and from workstation to workstation.

![Alt text](/assets/posts/Cisco_Copy_Run_Start.png)


__Here is the ping output:__

![Alt text](/assets/posts/Cisco_Ping_Workstation.png)

This tutorial is now concluded.  As always, you can post a comment below if you have any questions or concerns regarding this tutorial.



