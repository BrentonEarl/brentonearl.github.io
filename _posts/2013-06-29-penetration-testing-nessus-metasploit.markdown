---
layout: post
title: Penetration Testing with Metasploit 4 and Nessus 5.2
date: 2013-06-29
category: Security
descriptioni: "Basic Tutorial on how to use Metasploit with Nessus vulnerability scanner results."
comments: yes
---

Metasploit is a powerful penetration testing tool. The web GUI is simplified penetration testing to the fullest. Just about anyone with a little bit of knowledge of operating systems and security can install Metasploit in order to start auditing networks. When coupled with Nessus Vulnerability Scanner, it is difficult to miss a security risk on a host within a network. Nessus has the ability to export its vulnerability reports into a format that can be imported into Metasploit. Using this imported data will allow Metasploit to recognize a larger spectrum of vulnerabilities on the target host.



 
If you wish to test out Metasploit and Nessus, you can download the Metasploitable virtual machine from Rapid 7. Metasploitable comes pre-installed with outdated software on an unsupported version of Ubuntu. It has many vulnerabilities that will give an attacker shell access. It is recommended that this virtual machine is kept on an isolated portion of your network due to its security risk.

- Metasploit Download @ www.rapid7.com
- Metasploitable Virtual Machine Download @ www.rapid7.com
- Nessus Download @ www.tenable.com

In this video I will be demonstrating how to use Metasploit and Nessus by exploiting the Metasploitable Virtual Machine.

{% include nessus_metasploit.markdown %}


