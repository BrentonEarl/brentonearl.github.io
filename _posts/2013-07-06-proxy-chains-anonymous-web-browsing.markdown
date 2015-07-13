---
layout: post
title: Proxy Chains - Anonymous Web Browsing
date: 2013-07-06
category: Security
description: "Learn how to become Anonymous in your Web Browser.  Software used is named Proxychains."
comments: yes
---


Proxychains is a tool that proxifies any program. It allows TCP and DNS tunneling through proxies and it has support for HTTP, SOCKS4 and SOCKS5 proxy servers. Proxychanins can mix different proxy types together in the same proxy chain. If you have HTTP and SOCKS proxies mixed in your configuration, proxychains will switch between protocols.  Proxychains makes it possible to access the internet from behind a restrictive firewall and hide your IP address. You can also use proxychains to access intranets from outside a local area network through a reverse proxy. It is possible to execute curl, wget, ssh, nmap, telnet, ftp, web browsers and vnc through proxychains.  The Proxychains web site can be found [Here](http://proxychains.sourceforge.net/)

{% include proxychains.markdown %}

Bonus:

This Bash Script will check to see if your proxy list has any inactive IP addresses.

{% highlight bash %}
#!/bin/bash 

# One IP Address per line, formated like so 111.222.333.444:1234
proxy_list='list.txt'
# Site checking IP status
url="http://www.google.com"
# File where active IP addresses are kept
output_file="working.txt"


timeout=1
cat $proxy_list | while read line 
do
        result=`HEAD -d -p http://$line -t $timeout  $url`
                if [ "$result" = "200 OK" ]; then
                echo "$line $result (proxy works)"
                echo "$line" >> $output_file
        else
        echo "$line (proxy does not work or request timed out)"
        fi
done
{% endhighlight %}
