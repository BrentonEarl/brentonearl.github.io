---
layout: post
title: Responsive Web Design
date: 2013-08-09
category: html5
description: How to approach the task of designing a web site that is optimally programmed for viewing on a wide array of devices.  Mobile phones, Tablets, Desktops and Laptops.
comments: yes
---

According to statistics comparing Mobile device usage to Desktop usage from August 2012 to July 2013, Mobile device usage is up 5.18% in the United states.  Worldwide mobile device usage is up 1% more than that (6.26%).  What does this mean for web developers?  It means that designing web sites and web applications is ever increasingly more difficult as a result of the wide array of web site viewing options.  In other words, your web site needs to be just as presentable on a Desktop Computer Monitor as it would be on an IPhone or Android device screen.  It also means that images, advertising units, and even the code of your web page needs to be more compact than ever.  The page load time needs to be quick, because mobile device users are on the go and expect fast interaction with the web.  As a result of all of these new requirements, leading experts have established a new standard in web design.  Responsive Web Design.

[Global Stats Mobile Vs Desktop](http://gs.statcounter.com/#mobile_vs_desktop-ww-monthly-201208-201307)
[US Stats Mobile Vs Desktop](http://gs.statcounter.com/#mobile_vs_desktop-US-monthly-201208-201307)

#### A Responsive Design Layout

For years web developers designed their web sites with the idea that viewers would be visiting their web site on computer monitors with resolutions 800 by 600 and up.  With the explosion of mobile device usage, this form of web design is out the door.  Designing web sites using fixed or static elements will make it difficult for mobile users to view your web site.  Using advertising with predefined sizes will only make our web page truncated and difficult to read.  Images with static sizes will bloat and disfigure the layout of your design.

Take this example of a menu using a div element:
{% highlight html %}
<div id="menu">
  <ul>
    <li><a href="/">Index Page</a></li>
    <li><a href="/about">Products</a></li>
    <li><a href="/services">Services</a></li>
    <li><a href="/contact">Contact Us</a></li>
  </ul>
</div>
{% endhighlight %}

This menu is styled using the following style sheet:

{% highlight css %}
#menu {
  width: 500px;
  height: 50px;
  padding: 10px;
  margin: 20px;
  }
#menu ul { display: block; }
#menu ul li { display: inline; padding: 3px; }
{% endhighlight %}

If you were using a layout geared to __respond__ to different viewing resolutions, you would be using Responsive Web Design or RWD.  In RWD you do not set static pixelated values for any element on the page - not even font fonts, headings, bold or italic faced text.  By setting static values to any element on your web site, your web site will not scale with different screen resolutions.  The above example can easily become a RWD by converting every pixelated value into a percentage.  Lets look at the menu example again.  The HTML will stay the same.  You just need to change the style sheet to apply RWD.

{% highlight css %}
#menu {
  width: 90%;
  margin-left: 5%;
  height: 10%;
  }
#menu ul { display: block; }
#menu ul li { display: inline; padding: 1%; }
{% endhighlight %}

You will notice that every dimension and alignment is set using a percentage.  The document size, margin are set and the menu width, margin, height and spacing are set.  Lets adjust the layout to not only include the menu, but to also include a header, a content pane and a footer.  The menu will be located on the left side.

{% highlight html %}
<html>
  <head>
    <title>Site Title</title>
  </head>
<body>
  <div id="header">
    <h1> Site Title </h1>
  </div>
  <div id="menu">
    <ul>
      <li><a href="/">Index Page</a></li>
      <li><a href="/about">Products</a></li>
      <li><a href="/services">Services</a></li>
      <li><a href="/contact">Contact Us</a></li>
    </ul>
  </div>
  <div id="content">
    <h2>Text Heading</h2>
    <p> Web Site content goes here. </p>
  </div>
  <div id="footer">
    <p> Copyright 2013 - Site Title - Creator </p>
  </div>
</body>
</html>
  
{% endhighlight %}

Please note that each element has an id that defines its purpose in one word.  The simpler you make your site layout, the faster your web page will load on every mobile or stationary device.  Let take a look at the corresponding style sheet for the previous HTML snippet.

{% highlight css %}

#header {
  width: 90%;
  height: 15%;
  margin-left: 5%;
  }
#menu {
  width: 30%;
  height: 10%;
  margin-left: 5%;
  float: left;
  }
#content {
  width: 60%;
  margin-left: 5%;
  float: left;
  }
#footer {
  width: 90%;
  height: 10%;
  margin-left: 5%;
  }
{% endhighlight %}

With this styling the web page will resize based on the size of the screen.  A screen size width of 1024 pixels means that the menu will be 307.2 pixels wide and the content will be 614.4 pixels wide.  The footer and header will be 921.6 pixels wide.  The margin of all of the content will add a spacing of 51.2 pixels around all content.  As a result of using precents, these pixel values with update automatically when the browser window is resized or if the web page is viewed on a device with a smaller screen.

***

#### Summary

Based on what was discussed, you should understand the concept of responsive web design.  You should also have a basic idea of how to apply RWD on a new or existing web site.  Most web sites shouldn't need to be redesigned, just restyled using percentages within style sheets.  If you plan to redesign your entire web site to use RWD you should choose to move to HTML5- it will simplify your redesign process.

*  [Responsive Web Design @ Wikipedia](http://en.wikipedia.org/wiki/Responsive_web_design)
*  [Responsive Web Design - An A List Apart Article](http://alistapart.com/article/responsive-web-design)
*  [Move to HTML5](http://exitstatusone.com/convert-web-site-from-html4-to-html5/)
