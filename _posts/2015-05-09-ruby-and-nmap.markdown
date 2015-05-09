---
layout: post
title: Ruby and Nmap
date: 2015-05-09
category: Security
description: A short introduction to the useful Ruby Gem, ruby-nmap.
comments: yes
---

I have been a fan of Nmap for many years because of its reliability and effectiveness.  For those of you who do not know what Nmap is: Nmap (or Network Mapper) is a free and open source network port scanner that identifies and probes network devices (computers, phones, routers etc.) of all types.  I have used it for basic tasks such as identifying what hosts are connected to my LAN.  I have used it for complicated tasks such as identifying vulnerabilities or finding holes in firewalls. It can be used on any type of network that uses the IP protocol.  Nmap can also be scripted using NSE (Nmap Scripting Engine) Scripts.  I am sure it has other uses, but those are the ways I have traditionally used Nmap.

Recently I decided to create a piece of software that uses Nmap to discover hosts on whatever network it is installed upon.  The software is written in ruby and has an interface that was created using Sinatra.  The software itself has some issues still, as I have not put much time into it to finish the project, but it does make use of Nmap through a Ruby gem called ruby-nmap.  Ruby-nmap is a gem created by a developer from [Sophsec](https://github.com/sophsec) and is a pure ruby interface to using Nmap progmatically.  The gem itself is very useful for those who wish to define in Ruby exactly what Nmap will scan.

Ruby-nmap will allow you to do all the same things you can do by just running the Nmap command at any command line interface in Linux, Windows or on a Mac, but in Ruby.  It is a great gem to use if you are building software written in Ruby that interfaces with Nmap.

_You need to install Sudo, Nmap, Ruby, Rubygems and the ruby-nmap gem to follow along!_

#### Install Nmap, Ruby and Rubygems

I will not be covering how to install Nmap, Ruby or Rubygems because in this article because it is differently from Windows to Linux to Mac.  Sorry for that, but there are plenty of articles online that explain how to do this step already.

#### Install the Ruby-nmap Gem

I will assume you are running Linux or a Mac, because lets face it, Ruby on Windows is no fun.  Run the following at the command prompt:

{% highlight ruby %}

[~]$ gem isntall ruby-nmap

{% endhighlight %}

Next open an interactive ruby shell by running the irb command:

{% highlight ruby %}

[~]$ irb

{% endhighlight %}

If your prompt looks something like this, you are using the interactive ruby shell:

{% highlight ruby %}

:001 > 

{% endhighlight %}

Now type in the following exactly as it is displayed and after you hit enter it should run a basic ping scan on your local host (the computer you are working on):

{% highlight ruby %}

:001 > require 'nmap/program'
 => true 
:002 > Nmap::Program.scan do |nmap|
:003 >     nmap.ping = true
:004?>   nmap.targets = '127.0.0.1'
:005?>   end

Starting Nmap 6.47 ( http://nmap.org ) at 2015-05-09 16:24 MDT
Nmap scan report for localhost (127.0.0.1)
Host is up (0.000032s latency).
Nmap done: 1 IP address (1 host up) scanned in 0.00 seconds
 => true 
:006 > 

{% endhighlight %}

The next example uses the sudo program to drop to root privileges so you can run a syn scan with nmap that requires higher permissions than a basic user (Hopefully you are not running as root user!):

*  Skip the require if this is the same irb shell because its already required from the last example!

{% highlight ruby %}

:001 > require 'nmap/program'
 => true 
:002 > Nmap::Program.sudo_scan do |nmap|
:003 >     nmap.syn_scan = true
:004?>   nmap.targets = '127.0.0.1'
:005?>   nmap.ports = [20,21,22,23,25,80,110,443,512,522,8080,1080]
:006?>   end

{% endhighlight %}

And then you should see the following output asking for your user password followed by the results of the Nmap scan:

{% highlight ruby %}

[sudo] password for facerip: (type your user password when prompted!)

Starting Nmap 6.47 ( http://nmap.org ) at 2015-05-09 16:29 MDT
Nmap scan report for localhost (127.0.0.1)
Host is up (0.000035s latency).
PORT     STATE  SERVICE
20/tcp   closed ftp-data
21/tcp   closed ftp
22/tcp   closed ssh
23/tcp   closed telnet
25/tcp   open   smtp
80/tcp   closed http
110/tcp  closed pop3
443/tcp  closed https
512/tcp  closed exec
522/tcp  closed ulp
1080/tcp closed socks
8080/tcp closed http-proxy

Nmap done: 1 IP address (1 host up) scanned in 2.35 seconds
 => true 
:007 > 

{% endhighlight %}

I hope you can see how useful the ruby-nmap gem can be from a rubyist's perspective.  Yes, these are very basic examples, but there is a whole wealth of useful ways to make use of this ruby gem.  If you decide you like the gem but it is missing some key feature, please contribute to the ruby-nmap project [here](https://github.com/sophsec/ruby-nmap).  The developer just released version 0.8.0 fixing a number of bugs.

If you have any questions feel free to comment below and I should get back to you shortly.  I hope you enjoyed my article.

#### Article Resources

*  [Nmap](https://nmap.org/)
*  [Sudo](http://www.sudo.ws/)
*  [Ruby](https://www.ruby-lang.org/en/)
*  [Rubygems](https://rubygems.org/)
