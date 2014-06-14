---
layout: post
title:  "Introducing: Sinatra Web Application Framework"
date: 2013-07-24
category: sinatra
description: "Sinatra is a great web application framework.  Many know about Sinatra, but for those who don't, it is worth a look.  I am using it for my current project."
comments: yes
---


[Sinatra](http://www.sinatrarb.com/) is great at saving time and effort by way of simplicity.  As an alternative to [Ruby on Rails](http://rubyonrails.org/), [Merb](http://www.merbivore.com/), and others, Sinatra is quite the toolkit.  Sinatra has the ability to launch web applications using many different web servers and run in multitudes of environments.  Just this week alone, I implemented some software that allows me to upload a post to my blog remotely over encrypted connections and another that processes the new post and automatically re-generates my [Jekyll](jekyllrb.com) static web site.   I have plans to create an Android web application that will allow me to create posts from my phone as well.  Further down the road I plan to implement a network monitoring suite using various open source tools with Sinatra as the web front end.  Yes, its that simple to write software with [Sinatra](http://www.sinatrarb.com/).

####Install Sinatra

Sinatra has very little dependencies, and by little, I mean it depends on itself. (Oh, and _Obviously_ you need to have [Ruby](http://www.ruby-lang.org/) installed!)  You can install Sinatra on Mac, Windows, Linux, or all of the above- as long as the system supports the Ruby programming language.  The following will give you a functional environment to begin developing Web Applications.

{% highlight ruby %}
$ gem install sinatra
{% endhighlight %}

####So what makes Sinatra so effortless?

[Sinatra](sinatrarb.com) keeps it simple.  For a number of years [Ruby on Rails](http://rubyonrails.org/) was my go to web application framework for projects that required advanced solutions outside of what [Drupal](https://drupal.org/) or [Wordpress](http://wordpress.org/) could offer.  I should have explored more  because Sinatra blows Rails out of the water in terms of development speed.  Sinatra also has such a simple API that creating Web Apps can include just lines of code.

Example App:

{% highlight ruby %}

require 'sinatra'

get '/' do
  'Welcome To Exit Status One'
end

{% endhighlight %}


This App will respond with a 200 HTTP Status Code and display "Welcome To Exit Status One" on the web page.  Yes it's simple, but it can get quite complicated.  That is the beauty of Sinatra.  Your Web Application can be as simple or as complicated as you want to make it.

####Useful Sinatra Resources

The first thing I noticed about Sinatra is how scarce complete code examples are. Ruby on Rails is such a popular framework that you can find just about anything you need with one or two google searches.  After much googling and speaking to fellow programmers in IRC, I compiled a list of Sinatra resources.  Don't get me wrong, Sinatra is popular, but it is not quite as mainstream as Rails due to the fact that it does not hold your hand like Rails.  Here are some resourceful links covering my research on Sinatra.

__Books__

-  [Sinatra: Up and Running](http://shop.oreilly.com/product/0636920019664.do)
-  [Sinatra Book](http://sinatra-book.gittr.com/)

__Web Sites__

-  [Sinatra Home Page](http://www.sinatrarb.com/)
-  [Github sinatra/sinatra](https://github.com/sinatra/sinatra/)
-  [Lightweight Web Apps: Getting Started With Sinatra](http://blog.chrisblunt.com/lightweight-web-apps-getting-started-with-sinatra/)
-  [Just Do It: Learn Sinatra, Part One](http://rubysource.com/just-do-it-learn-sinatra-i/)
-  [An Introduction to Ruby, Sinatra, and Haml](http://blog.maxaller.name/2010/01/a-brief-introduction-to-ruby-sinatra-and-haml/)
-  [Using Markdown with Sinatra](http://www.millwoodonline.co.uk/blog/using-markdown-with-sinatra)
-  [A Sinatra and Datamapper To Do List](http://ididitmyway.herokuapp.com/past/2010/3/30/superdo_a_sinatra_and_datamapper_to_do_list/)
-  [Upload and download files in Sinatra](http://alfuken.tumblr.com/post/874428235/upload-and-download-files-in-sinatra)
-  [404 and other Errors in Sinatra](http://ididitmyway.herokuapp.com/past/2010/11/16/404_and_other_errors_in_sinatra/)
-  [Sinatra authentication, Datamapper, rack flash and other great things](http://www.millwoodonline.co.uk/blog/sinatra-authentication-datamapper-rack-flash-other-great-things)


__Additional Software__

-  [Sinatra-captcha](https://github.com/bmizerany/sinatra-captcha)
-  [Sinatra-authentication](https://github.com/maxjustus/sinatra-authentication)

I hope you find this post useful.  Please stay tuned because I have plans to update the site regarding my latest escapades using Sinatra.  I may have to add a project page!
