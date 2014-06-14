---
layout: post
title: Convert Your Web Site To HTML5 
date: 2013-08-08
description: Discusion regarding the process of moving an existing web site from HTML4 to the new web standard of HTML5.
category: html5
comments: yes
---


The [World Wide Web Consortium](http://www.w3.org/) announced version 5 of the HTML standard in December, 2012.  During the time between last December and the present, HTML5 has gained a lot of traction. In the present state of the internet, HTML5 is supported by the most recent versions of Internet Explorer, Firefox, Google Chrome, Safari, Apple and Android Mobile web browsers.  HTML5 provides new tags that were created to match the needs of modern websites.  In my opinnion, Search Engine Optimization becomes much more manageable after converting your site to HTML5.  In adition, cascading style sheets are less of a headache.  Throughout the rest of this article I will build a case to help you decide whether your web site should be running HTML4 or HTML5.


#### What does HTML5 Solve?

Surely more than a few people have wondered what the purpose of switching to HTML5 actually is.  Every piece of software eventually needs to be upgraded.  Software aside, the tools and programing languages that create that software must be updated as well.  The amount of people using the internet continues to grow, and developers are always in a race to produce fuller media rich content.  The process of designing code that will create that sort of environment requires more and more effort. Essentially, HTML5 solves a lot of the issues web developers work around in order to serve the web content that is expected by users.

How HTML5 pages are programmed in comparison to HTML4 pages is not much different.  A number of new elements and attributes were added that will undoubtedly make the process of organizing the code on an HTML page much more manageable.  As it stands, HTML4 web sites are dominantly organized by the div element. HTML5 aims to make code easier to read and easier to implement.  The following is a full list of [New Elements](http://www.w3schools.com/html/html5_new_elements.asp) added to HTML5.  

#### HTML5 Template

This basic example shows how HTML5 really tells the reader what is happening in the code.  If you are unfamiliar with HTML in general, just try to imagine that the header, nav, section, article and footer tags are all replaced with an opening and closing div tag.  Imagine all of those tags using the same tag.  That is what web developers have been working with for several long years.  While HTML is not difficult to learn, it isn't the least tedious programming language.

{% highlight html %}
<!DOCTYPE HTML>
<html>
  <head>
    <title>Site Title</title>
  </head>
<body>
  <header>
    <h1>Site Title</h1>
  </header>
  <nav>
    <ul>
      <li>Link to Home Page</li>
      <li>Link to Second Page</li>
      <li>Link to etc. etc. </li>
    </ul>
  </nav>
  <section>
    <article>
      <header>
        <h5>News Title</h5>
      </header>
      <p>News Article Content</p>
    </article> 
  </section>
  <footer>
    <p>Copyright 2013 Some Site at somesite.com</p>
  </footer>
</body>
</html>
{% endhighlight %}

#### To Switch Or Not To Switch?

The way I chose to make the switch to HTML5 on [exitstatusone.com](exitstatusone.com) was by weighing the pros and cons.  On one had I had the issue of browser compatibility.  On the other hand HTML5 provided a way to easily restructure the code on my web site to make it cleaner and provide a faster execution time.  The compatibility issues will soon enough disappear as full HTML5 support is implemented in all of the major and minor web browsers.  This is happening much faster than you would think.  Code execution and structure are far more important to me because the way I had my site designed was getting difficult to manage.  Not due to poor coding technique, but due to the fact that [Jekyll](jekyllrb.com) generates templates into static web pages based on a number of different source files.  Each source file had so many different div tags it was getting confusing.  

I think that most web developers will find the readability of HTML5 to be a big plus.  Just the implementation of the new elements and attributes should be more than enough to prompt web developers to make the switch.  In the end, the decision ultimately lies in what type of web site you are running and what type of web application software is being deployed.
