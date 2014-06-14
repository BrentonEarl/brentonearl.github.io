---
layout: post
title:  Medusa - Parallel Network Login Auditor
date: 2013-07-16
category: Security
description: "Learn how to brute force network service credentials using Medusa Log In Auditor"
comments: yes
---

Medusa is a login credential auditor.  It has the ability to remotely brute force many different network protocols.  This article discusses the process of auditing the SSH (secure shell) protocol.  SSH is a service installed on systems that require access to the command line via a remote connection.  The remote system in this scenario is located on the local area network running the Metasploitable Virtual Machine.  Metasploitable was built by Rapid7, creator of the Metasploit Penetration Testing Framework.  The process discussed includes the usage of Virtual Box (Virtualization Software), nmap (Port Scanner), and Medusa (Brute Force Software).  

__Please remember that attacks such as these should only be used in a controlled environment, on a network where you have authorization from the network administrator.__


####Scenario

An attacker identified a remote service that is connected to the network at 192.168.2.4.  This was discovered by port scanning the subnet 192.168.2.0/24.  The remote server had various services running on it that are vulnerable to a number of exploits.  The attacker also discovered that a remote network share provided open access to anyone on the network.  By probing the network share, it was possible to determine a number of user accounts available to log into remotely.  After executing a network mapping using nmap to port scan the remote server, the attacker confirmed that the remote server had the SSH service running on port 22.  With the network mapping and enumeration completed, the attacker executed Medusa to Brute Force the log in credentials required to log into the administrative account on the remote system.

__Short Video Example:__


{% include medusa.markdown %}
