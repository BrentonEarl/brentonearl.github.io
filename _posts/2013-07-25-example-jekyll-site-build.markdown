---
layout: post
title: Learn to build your own Jekyll Website
date: 2013-07-25
description:  "Tutorial showing how to build a full Jekyll web site.  Video included."
comments: yes
category: jekyll
---

In my previous posts about Jekyll Static Site Generator I wrote about the different ways you can add features to your Jekyll blog.  This post is covers the steps to create a Jekyll Web Site from start to finish.  First, I will discuss the Jekyll configuration file.  Second, I will talk about how to add a layout for your pages and for your posts.  Then I will hash out the process of adding posts to your site.  Finally, I will explain how to build your site, start the ruby web server, and how to have the web server regenerate your site in the background as you add new content.

After you finish reading this article, additonal reading can be found here:

-  [New Site Design](http://exitstatusone.com/new-site-design/)
-  [Jekyll - Metadata, Navigation, and Archives](http://exitstatusone.com/jekyll-metadata-navigation-archives/)
-  [Jekyll: Pagination, Site Map, and 404 Redirects](http://exitstatusone.com/jekyll-modifications/)

_If you want to skip all the reading, there is a video at the bottom of the page!_

#### Jekyll Configuration File


There are a variety of ways you can go about configuring Jekyll prior to rendering your site.  Personally, I like to have Jekyll generate the Metadata for each page, add a user name as an author for each post, set the site url so that my Rss file has the correct web address, set pagination to 5 pages on the index page, enable syntaxt highlighting, and custom url structure that only lists the name of each post.

Configuration file:

{% highlight yaml %}

name: "Exit Status One"
description: "This is a Blog about cool stuff like sheep.  We don't do sheep!" 
keywords: "Sheep, Safety, Epic Sheep"
user: "Cool Guy" 
url: "http://somesite.com"
paginate: 5 
markdown: rdiscount
permalink: /:title/
pygments: true  
changefreq: always 

{% endhighlight %}

#### Jekyll Site Layout

-  [Main Layout](/assets/default.html.txt)
-  [Post Layout](/assets/post.html.txt)

In the main layout I have a series of code that pulls the metadata for each web page.  I decided what text to include based on if the page contains the description and the category.  If the page does not contain a description or category, a default set of metadata will be generated based on what is set in the configuration file.  

The post layout simply formats the post body so that it fits nicely within the main layout.  When a post is generated it uses what is in the post.html, but the post layout inherits it's layout from the main layout.  Essentially the main layout page is used for every page, but it is possible to embed layouts within other layouts as you see in my post layout at the top of the header.

#### Posting Content to Your Site

Adding Posts to your web site is quite simple.  Assuming you are using [Markdown Syntax](http://daringfireball.net/projects/markdown/), adding a post is as simple as writing a text file.  The only difference between writing an actual text file and markdown syntax is that you have a certain format to follow for headings, bulleted lists, adding links and images, amongst other formatting.  If you watch the video below you can see that the transcript I used to film the video is written using Markdown Syntax.


#### Build and Serve Jekyll

Building a Jekyll web site is quite easy.  You can do it with just one command, but you can build the site and then serve it with two different commands to assure there are no errors in any of your code or Markdown formatted posts.

__Build__


{% highlight bash %}
jekyll build
{% endhighlight %}

__To Start the Rub Web Server__
{% highlight bash %}
jekyll serve
{% endhighlight %}

__To Start the Ruby Web Server and Regerate as you add content__
{% highlight bash %}
jekyll serve -w
{% endhighlight %}


####Videos are fun!

{% include example_jekyll_build.markdown %}




#### Summary

Ultimately you will need to do some programming in order to successfully build a feature rich Jekyll web site.  Most people use Jekyll to build their own blog, however Jekyll can be used to build all sorts of different web sites.  For example, you can build your whole web site with Jekyll and then use [Sinatra](http://www.sinatrarb.com/) to add a Contact form on a Contact page and a Comments section in your posts.  My experience with Jekyll has been excellent and I have learned a lot. If you are going to switch to Jekyll or just researching alternative web development platforms, you will also learn a lot about web site development.
