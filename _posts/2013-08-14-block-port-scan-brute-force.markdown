---
layout: post
title: Block Port Scans and Brute Force Attacks
date: 2013-08-14
description: Learn to block port scans and brute force attacks in Linux
category: Security
comments: yes
---

It is a guarantee that any internet facing desktop or server will be probed by attackers.  This discussion is geared toward Linux servers, but the same techniques can be applied to any other Linux installed device.  Assuming your server is accessible on public networks and it is running network services, it is important that you take the appropriate security precautions.  Port scans __will__ bombard your network card and brute force attempts will plague your log in services.  Sometimes a strong password just is not enough.  After all, brute force attempts and port scans do after use bandwidth and do cause your network to slow down.

This article is follow up to a previous post:  [Medusa - Parallel Network Login Auditor](http://exitstatusone.com/medusa-log-in-auditor/) where the average brute force attack is demonstrated.

I will outline a basic set up which includes Iptables, Psad and Fail2ban.

* [Iptables - Linux kernel firewall](http://en.wikipedia.org/wiki/Iptables)
* [Psad - Intrusion Detection and Log Analysis with iptables](http://cipherdyne.org/psad/)
* [Fail2ban - Intrusion Prevention Framework](http://www.fail2ban.org/wiki/index.php/Main_Page)

#### Iptables

In order for any of this to work effectively, it is important to have some sort of firewall rules set up so that you can log dropped packets and control what ports should be open and closed.  At the very least you should have something similar to the following:

* Assuming the only service you are running is SSH
{% highlight bash %}

# Allow ssh
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow icmp
iptables -A INPUT -p icmp -j ACCEPT

# Allow local
iptables -A INPUT -s 127.0.0.1 -j ACCEPT

# Allow connections already made
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

# Enable Logging of Input and Forwarding
iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "DENIED: " --log-level 7
iptables -A FORWARD -m limit --limit 5/min -j LOG --log-prefix "DENIED: " --log-level 7

# Drop all other traffic
iptables -A INPUT -j DROP
iptables -A FORWARD -j DROP

{% endhighlight %}


#### Intrusion Detection and Log Analysis

[Psad](http://cipherdyne.org/psad/) is a great piece of software for a single server, such as a colo, or a home server.  It may be considered a great tool for companies with a single server as well.  I am sure the Psad guys would disagree, but I do not recommend using Psad for large scale operations.  For that I would recommened [Snort](http://www.snort.org/).  Moving forward.

Psad scans the log files on the server and looks for dropped packets.  If the dropped packets fit the pattern of a port scan, the packets are logged, and if configured to, blocked by source IP address.

A default installation of Psad will log port scans and email the system administrator.  What I would like to discuss is how to set up Psad to automatically block port scans as well.  The following settings are located in the psad.conf file.  I am running Debian, so it is located at /etc/psad/psad.conf, it may be different for other Linux distributions.

* These are the settings you need to change in order to have email notifications, logging and automatic iptables integration.
{% highlight bash %}

EMAIL_ADDRESSES             your@email.com;
EMAIL_ALERT_DANGER_LEVEL    1;

FW_MSG_SEARCH               DROP;

DANGER_LEVEL1               5;    ### Number of packets.
DANGER_LEVEL2               15;
DANGER_LEVEL3               150;
DANGER_LEVEL4               1500;
DANGER_LEVEL5               10000;

ENABLE_AUTO_IDS             Y;
AUTO_IDS_DANGER_LEVEL       2; # Or your desired danger level
IPTABLES_BLOCK_METHOD       Y;
{% endhighlight %}

The rest of the options in the psad.conf should be left at defaults unless you have some sort of specific configuration.


#### Intrusion Prevention

[Fail2ban](http://www.fail2ban.org/wiki/index.php/Main_Page) is an excellent piece of software for blocking brute force attempts.  I highly recommend that it is installed on every linux server running SSH.  It is also very useful in blocking brute force attempts on HTTP forms as well as FTP credentials.  Fail2ban will monitor just about any service that allows network authentication.  There are far too many services out there, so I will show a basic set up for SSH.

* This is a default rule in the jail.conf configuration file
* The port reflects the port I use for SSH
* The maxretry designates that any failed log in attempts should be banned
* This is set up like this because I use public/private key authentication on my server
{% highlight bash %}

[ssh]

enabled = true
port    = 3000
filter  = sshd
logpath  = /var/log/auth.log
maxretry = 1

{% endhighlight %}

Take it one step further and ban all DDoS attempts on SSH.  Again I chose to ban any activity that had more than one connection attempt.

{% highlight bash %}
[ssh-ddos]

enabled = true
port    = ssh
filter  = sshd-ddos
logpath  = /var/log/auth.log
maxretry = 1
{% endhighlight %}

#### Password Strength

Even with all of the above precautions in place, a timed, long term attack can still manage to break into your system if you have a weak password.  It will take a very long time, assuming you have the same set up as I do.  It is unlikely you will choose to ban all traffic with more than one failed log in attempt though.  My configuration is based on the fact that I am the only person that should be logging into the server and that I am using key authentication.  If I was using password authentication, I would probably change the maxretry to 6 attempts.  6 attempts provides an attacker with greater chance of successful intrusion.  Assuming the attacker has automated his or her attack, the typical configuration of Fail2ban will ban the source IP address for one hour.  This allows for 144 failed log in attempts within 24 hours.

Very often, weak passwords may only take a few attempts to crack if the attacker has some sort of intel about the target machine.  Even without any information about the target machine, 144 attempts might be enough to crack an account in one day.  It is likely that in a weeks time (1008 attempts) a weak password will not be compromised.

I use [APG - Automated Password Generator](http://linux.die.net/man/1/apg) to generate my passwords.  Here is an example of agp in action: 

* Using the old password of 'catfood' 
{% highlight bash %}
root@localhost~# apg

Please enter some random data (only first 16 are significant)
(eg. your old password):>
EfyurbAkUj4 (Ef-yurb-Ak-Uj-FOUR)
ofdynErvEif5 (of-dyn-Erv-Eif-FIVE)
UrtUttetEk8 (Urt-Utt-et-Ek-EIGHT)
JocNadEnVam1 (Joc-Nad-En-Vam-ONE)
Ur6Oboykyet (Ur-SIX-Ob-oyk-yet)
CedsidIn3 (Ceds-id-In-THREE)

{% endhighlight %}

***

####Summary

Each day countless servers are hacked due to weak passwords, poor encryption and outdated software.  While the above will not prevent zero day exploits, it will stop service detection and enumeration.  It will keep your server credentials safe.  Strong passwords and password rotations are important.  
