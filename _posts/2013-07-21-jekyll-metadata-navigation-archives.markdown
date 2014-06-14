---
layout: post
title: Jekyll -  Metadata, Navigation, and Archives
date: 2013-07-21
category: jekyll
description: “Add a dynamically generated HTML Metadata, Navigation Menu, and Archives to Jekyll Site Generator”
comments: yes
---

I have been using Jekyll for about a month.  I continually find ways to improve my code and add more functionality.  I added a few new things to make my job easier and also make the site easier to navigate.  The header of each web site contains what is called "metadata" that tells your web browser and search engines how to interpret it.  I programmed the site to automatically generate metadata so I will not have to add it.  I also added the ability to automatically generate a new links to the navigation menu as new pages are added to the site.  Finally, I added an Archvies page and Category page, because it is important for viewers to find older posts that are no longer listed on the front page.

If you have no idea what Jekyll is, please see: [This Post](/new-site-design/)

For further reading regarding other site mods I made in the past: [Jekyll Modifications](/jekyll-modifications/)

###Site Configuration

The first changes I made were to the site configuration, _config.yml.  I added the description, keyword, user, and url tags.  Previously I was using the title tag, but decided to remove that since that can be inherited from the Front Matter block header in each page.   Here is what my configuration now looks like:

{% highlight yaml %}
name: "Exit Status One"
description: "Exit Status One is a Blog about Information Security, System Administration, 
Network Administration, Programming, Web Design and Open Source Software."
keywords: "Linux, Cisco, Debian, Tech News, Linux Tutorials, Network Administration, 
Linux Networking, Information Technology, Information Security"

user: Bob
url: "http://exitstatusone.com"

paginate: 5

markdown: rdiscount
permalink: /:title/
pygments: true
changefreq: always
{% endhighlight%}

The name, description, keywords and user tags are all used to set information in the HTML metadata within the main site layout page.  The url tag is used in the script to generate the Rss Feed and the permalink tag is used to generate the link structure within site.

 
###HTML Metadata

The main layout is the only page that has HTML in it.  All other pages are formatted using [Markdown Syntax](http://daringfireball.net/projects/markdown/syntax) greatly reducing the time it takes to adjust the site design and write new posts.  With the new structure of the site I needed a way to set the correct meta data in each page without having to modify any code.  What I did was replace each portion of the content in the meta tags with variables used by jekyll to display information, and added a few of my own variables in the process.  The metadata code now reads:

{% highlight html %}
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title>{{"{{ site.name "}}}} - {{"{{ page.title "}}}}</title>
    <meta name="author" content="{{"{{ site.user "}}}}" />
    {{ "{% if page.description "}}%}
    <meta name="description" content="{{"{{page.description "}}}}" />
    {{ "{% else "}}%}
    <meta name="description" content="{{"{{site.description "}}}}" />
    {{ "{% endif "}}%}
    {{ "{% if page.categories "}}%}
    <meta name="keywords" content="{{"{{page.categories | join: ',' "}}}}" />
    {{ "{% else "}}%}
    <meta name="keywords" content="{{"{{site.keywords | join: ',' "}}}}" />
    {{ "{% endif "}}%}
    </head>
<body>
.....
{%  endhighlight %}

1.  Pull the Site name from _config.yml and appened the title listed in the Front Matter header of displayed child page (page.title)
2.  Pull the author name from _config.yml
3.  If the current page set a description in its header display it, otherwise pull down the description from _config.yml
4.  If the current page set a category, use that as the meta keywords for the page, otherwise use the keywords set in _config.yml

Now that the metadata code is set from variables, adding the metadata on a new page or post is as simple as:

{% highlight yaml %}

---
title: Cool Post
date: 2013-07-21
description: Awesome new post brah...
category: Cats
---

...post content...

{% endhighlight %}


 
###Navigation

Previously, when a new page was added I would be forced to go back into the main site template and edit some HTML  so that the navigation menu on each page linked to that page.  I am lazy when it comes to things like that and I was worried I would forget to make my edits.

To begin I added a tag to the header of each page in my site directory which I want to be listed in the Naviagtion menu.

{% highlight yaml %}

---
link_title: About
---
{% endhighlight %}


I then modified the menu code in the main site layout to reflect the following:

{% highlight html %}

<ul id="menu">
    <li><a href="/" title="{{"{{ site.name "}}}} Index">Home</a></li>
    {{ "{% assign sorted_pages = site.pages | sort:name "}}%}
    {{ "{% for node in sorted_pages "}}%}
      {{ "{% if node.link_title "}}%}
       <li><a href="{{"{{node.url "}}}}" title="{{"{{ node.title "}}}}">{{"{{node.link_title "}}}}</a></li>
      {{ "{% endif "}}%}
    {{ "{% endfor "}}%}
</ul>
{% endhighlight %}

1.  Default site index link pulls down site.name from _config.yml
2.  Sort through every page in the site and search the header of each page for “link_title”
3.  If link_title exists, print a menu list item with the page url, title and link title.

 

###Archives

My Archives page is far from complete, but it is worth mentioning.  

{% highlight html %}

<div id="archive">
    <h3>{{"{{ site.time | date: '%Y' "}}}}</h3>
    <hr />
    {{ "{%for post in site.posts "}}%}
            {{" {% unless post.next "}}%}
        {{ "{% else "}}%}
            {{ "{% capture year "}}%}{{"{{ post.date | date: '%Y' "}}}}{{" {% endcapture "}}%}
            {{" {% capture nyear "}}%}{{"{{ post.next.date | date: '%Y' "}}}}{{" {% endcapture "}}%}
            {{ "{% if year != nyear "}}%}
                <h3>{{"{{ post.date | date: '%Y' "}}}}</h3>
                <hr />
            {{" {% endif "}}%}
        {{" {% endunless "}}%}
        <ul>
            <li>{{"{{ post.date | date:"%b %d" "}}}} &raquo; <a href="{{"{{ post.url "}}}}" title="{{"{{ post.title "}}}}">{{"{{ post.title "}}}}</a></li>
        </ul>
    {{" {% endfor "}}%}
</div>

{% endhighlight %}

1.  Pull date from the server, parse out the present year and display
2.  Search through all posts on the site
3.  Find the current year's posts and all posts created in all previous years
4.  List posts by Month and Day, Post URL, and Post Title

There are a number of ways I could have generated the list of posts on the site and formatted them to be nice and pretty, but this will do for now.

***

I am pretty sure that everything I used in wordpress is now present on this site.  Time will tell. (O.o)   The only thing I do not have is an image gallery, which I am not all that crazy about, but may add as time progresses.