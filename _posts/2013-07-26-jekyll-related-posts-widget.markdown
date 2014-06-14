---
layout: post
title: "Jekyll: Related and Recent Posts Widget"
date: 2013-07-26
description: "Short article discussing the code behind a widget that adds a small blurb with links to related posts and categories to a page or post."
comments: yes
category: jekyll
---


Creating a web site that is easily navigated is important.  It is also important to make it easy for viewers to find content that is related to what they are reading.  I wrote a piece of code that can be nested inside a page or post, preferably a page/post that has a category set.  The code will check if the current page has a category and inserts links to other pages with the same category.  It also adds a list to the most recent posts on the web site.  I added it inside a div tag and floated it right, works well.

####Related Categories

{% highlight html %}
<h4>Related Posts</h4>
{{ "{% for post in site.posts "}}%}
  {{ "{% for category in post.category "}}%}
    {{ "{% if category == page.category "}}%}
      {{ "{% if post.title != page.title "}}%}
      <p>
        <a href="{{"{{ post.url "}}}}" rel="bookmark" title="Permanent link to ">{{"{{ post.title "}}}}</a>
        <span>{{"{{ post.date | date: %B "}}}} {{"{{ post.date | date: %e "}}}}, {{"{{ post.date | date: %Y "}}}}</span>
      </p>
      {{ "{% endif "}}%}
    {{ "{% endif "}}%}
  {{ "{% endfor "}}%}
{{ "{% endfor "}}%}
{% endhighlight %}

1.  Loop through all of the posts on the web site
2.  Open each post and find it's category
3.  If the Category of the current page matches, add it to the list
4.  If the Title of the current page matches the page in the list, remove it. (There is no reason to list a link to the current page.)
5.  Create a link with the post's corresponding URL, date and title

The only problem with this code is that if you have 500 posts with the same category name, the list will expand down the page and push your post content out of the way.  I will have to fix this another time, provided it becomes an issue.

####Recent Posts


{% highlight html %}

<h4>Latest Posts</h4>
{{ "{% for post in site.posts limit:4 "}}%}
{{ "{% if post.title != page.title "}}%}
<p>
<a href="{{"{{ post.url "}}}}" rel="bookmark" title="{{"{{ post.title "}}}}">{{"{{ post.title "}}}}</a>
<span>{{"{{ post.date | date: '%B' "}}}} {{"{{ post.date | date: '%e' "}}}}</span>
</p>
{{ "{% endif "}}%}
{{ "{% endfor "}}%}

{% endhighlight %}

1.  Loop through all of the posts on the web site, but only keep the 3 most recent posts
2.  List each page, but omit the page if it has the same title as the current page
3.  Create a link for each post, with it's corrensponding URL, Title, and Date

This works great unless the current page is a recent post.  If the current page comes up as one of the last 4 posts, then this code will only show the last three current posts.

***

With that, please be sure to check the blurb at the top right of the page that shows recent and similar posts!  Thanks for reading.
