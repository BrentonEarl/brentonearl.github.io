---
layout: post
title: Cisco - Basic OSPF Configuration
date: 2012-03-03
category: Cisco
description:  "Covers the rudimentary process of configuring a Cisco router to run the Open Shortest Path First protocol."
comments: yes
---

In this article I will be walking my readers through the process of configuring a Cisco router to use the OSPF routing protocol.  OSPF stands for Open Shortest Path First.  OSPF is an adaptive routing protocol for internet protocol networks.  OSPF uses link state routing and it uses the link state routing algorithm.  OSPF falls into the category of interior routing protocols. It operates as a single autonomous system.  For protocol specific information, please view RFC 2328 and RFC 5340.  For an in depth backgroun on the OSPF routing protocol, please view: [Wikipedia: OSPF](http://en.wikipedia.org/wiki/Open_Shortest_Path_First).

In my configuration, I will deploying one router, one switch, and two workstations.  The router will be using the OSPF routing protocol and the switch will be be a mostly default configuration.  I will be using a Class B network with a CIDR Value of /24, a subnet mask of 255.255.255.0, and the network address 172.16.0.0.  The router will have the IP address 172.16.0.1, work station 1 will have the IP Address 172.16.0.2, and work station 2 will have the IP Address 172.16.0.3.  As stated, the switch will be mostly a default configuration, aside from passwords and hostname.  It is important to note that I am executing this tutorial with the use of the Packet Tracer program created by Cisco.

**Network Diagram:**

![Alt text](/assets/posts/Switch_Router_2_WorkStations_ClassB.png)

Please refer to the article Cisco: Basic Router Configuration if you need help getting the basic settings on your router.  Also, please view the article Dia – The Diagram Creation Program for some insight as to how I created my network diagram.

**Step 1:**

First you must give your router an IP Address.  As stated, this router will be using the IP Address 172.16.0.1.  Type and Execute in global configuration mode, __interface fa0/0__.  Next, Type and Execute __ip address 172.16.0.1__. Finally, bring up the interface to the active state: __no shutown__.

![Alt text](/assets/posts/Cisco_Set_IP_Address1.png)

**Step 2:**

Second, you need to enable and configure OSPF on your router.  In global configuration mode, Type and Execute __router ospf 1__.  Where 1 is the OSPF process ID, it can be any number between 1 and 65535.  Next, Type and Execute __network 172.16.0.0 0.0.0.255 area 0__.  Where 172.16.0.0 is your network address, 0.0.0.255 is the inverse of your subnet mask, and area 0 is routing area ID of your network.  If you choose to use more than one router in your network implimentation, this is the place to enter other consecutive network statements.  Finally, Type and Execute the word __exit__ to exit back into global configuration mode.

![Alt text](/assets/posts/CIsco_OSPF_Network_Statement.png)

**Step 3:**

Remember to save your work.  Do this by Typing and Executing __copy running-config startup-config__.  Your work is saved now.  In Packet Tracer you should be able to ping from the router to each workstation, and from workstation to workstation.

![Alt text](/assets/posts/Cisco_Copy_Run_Start1.png)

And a quick ping to verify that network connectivity exists:

![Alt text](/assets/posts/Cisco_Ping_Workstation1.png)

This concludes the tutorial.  As usual, please email any questions regarding this article.  I will do my best to respond in an accurate timely fashion.




