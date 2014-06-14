---
layout: post
title: New Site Design
date: 2013-07-08
category: jekyll
description: "Exit Status One has been revamped."
comments: yes
---

For several years Wordpress has been the content management system of choice for Exit Status one. Recently this web site moved from shared hosting to a virtual private server.  At this point it became important to minimize the memory footprint that Apache created in order to run Exit Status One.  After all, a VPS can be used for more than just web site hosting- and I intend to do so.  However, it is difficult to estimate how much system resources a web site uses when it is running on a shared host.  After analyzing the logs, bandwidth, system load, it was more than obvious that Wordpress was bogging down the rest of the running services.

The issue at hand was deciding to continue publishing with Wordpress, or to move on to a new approach to blogging.  That is when I found [Jekyll](http://jekyllrb.com/).  Jekyll is simple, blog-aware, and it generates static web sites.  It is written in [Ruby](http://www.ruby-lang.org/), yet ruby code is not used to display the generated web site once it is time to go live with your site.

Jekyll differs from Wordpress in a number of ways.  There is no database because your web site content is generated directly into the web site as HTML.  No administrative panel is necessary because all posts, feeds, uploads, and site modifications are done on your computer and then uploaded directly to your web host.  Comments are not included in the default site.  I found it to be a pain to moderate comments that were an infinite list of spammers anyway...  Jekyll gives you the ability to deploy your web site anywhere because every page is written in HTML and formatted with CSS- no PHP required.

Jekyll does include many of the features that Wordpress also includes.  Permalinks, Categories, Custom Layouts, Media Galleries, Plugins and RSS / Atom news feeds are all included.  Essentially, all you are missing out on with Jekyll is comments.  You can program your site to allow comments, no big deal.

Jekyll is much much simpler to operate once you have developed your web site.  Create your pages and posts, your plugins installed and configured, everything customized, you are ready to build your web site.  It really is very simple.  With knowledge of [HTML](https://en.wikipedia.org/wiki/HTML) and [CSS](https://en.wikipedia.org/wiki/CSS) you can create your web site without writing a single piece of ruby code.  Creating posts to a Jekyll blog is trivial.  Just write text files, rebuild your site, and reupload your site to your host.

There are a number of ways to upload a Jekyll generated site to a web host or server.  My favorite, and the method preferred by the Jekyll community, is using Git.  The other options are: [FTP](http://en.wikipedia.org/wiki/File_Transfer_Protocol), [SCP](http://en.wikipedia.org/wiki/Secure_Copy_Protocol), and [Rsync](http://en.wikipedia.org/wiki/Rsync).  Generally speaking, it is a better idea to stick with Git.

Reasons to use Git:

-  Ability to roll back changes
-  Site back ups
-  Share your code with the world
-  Fork a site to develop another site

Installing Jekyll and building a web site is [quick and easy](http://jekyllrb.com/docs/quickstart/).  You can have a web site up and running in 5 minutes using Jekyll's default site templates.  Basic usage is described [Here](http://jekyllrb.com/docs/usage/) and the full installation documentation is [Here](http://jekyllrb.com/docs/installation/).  For a full listing of web sites using Jekyll please check out the [Jekyll Wiki Page](https://github.com/mojombo/jekyll/wiki/Sites).


All in all, the migration from Wordpress to Jekyll has been enjoyable.  The process of developing my site became easier and easier as I adjusted to the working environment.  Now all I have to do to write a new post is open a terminal with Vim!  There is no need to worry about Wordpress getting hacked.  There is nowhere to log in, inject code, or database to sql inject- no moving parts.  I will continually provide updates regarding my experiences with Jekyll.  I have plans to implement new plug ins, so keep checking back!

