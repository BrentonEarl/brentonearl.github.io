---
layout: post
title: "Basic Sinatra Blog"
description: "How to create a basic Sinatra blog with search capability."
date: 2013-08-03
category: sinatra
comments: yes
---

In my effort to learn [Sinatra](http://www.sinatrarb.com/) I decided to create a few simple web applications that I will later combine into one full web application.  For now I created a basic blog that reads data from a MySQL database and displays a feed on the home page for each article.  When clicked on, each article is displayed in its own window.  The typical basic blog.  I also added the ability to search the database for Articles.

Rather than run my application using the default ruby web server [WEBrick](http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick.html), I chose to use [Thin](http://code.macournoyer.com/thin/) web server.  I chose this option because Thin is faster than WEBrick, in my opinion anyway.

#### Application Dependencies

In entirety, my web application uses the following Gemfile in order to meet dependencies.  Obviously including Sinatra and Thin.  Data mapper is used to connect to the database and dm-mysql-adapter is to tell Data mapper to use MySQL to connect to the database.

{% highlight ruby %}
# Gemfile
source 'https://rubygems.org'

gem 'sinatra'
gem 'data_mapper'
gem 'dm-mysql-adapter'
gem 'thin'

group :development do
    # Testing
    gem "rspec"
    gem "cucumber"
    gem "capybara"
end
{% endhighlight %}

_(More on rspec, cucumber and capybara in another post.)_

#### The Database Model

This web application uses [Data Mapper](http://datamapper.org/) to interface with the MySQL database.  The current model establishes a field in the database for the title, author, body, permalink, category and the date the article was created.

Here is the model.rb that contains the relevant information to connect to the database, create the required table and set column properties:

{% highlight ruby %}
#!/usr/bin/env ruby
require 'data_mapper'
require 'dm-mysql-adapter'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'mysql://user:password@localhost/exitstatusone_dev')
class Content
    include DataMapper::Resource
    property :id,         Serial
    property :title,      String,  :required => true
    property :body,       Text,    :required => true
    property :permalink,  Text,    :required => true
    property :author,     String,  :required => false
    property :category,   String,  :required => false
    property :created_at, String,   :required => true

    validates_uniqueness_of :title, :body, :permalink
end
DataMapper.auto_upgrade!
{% endhighlight %}

_(The columns of each table obviously should have more structure to guarantee the correct data is inserted.  Simplicity was important so I left the defaults that Data mapper sets for strings and text fields.  The created_at column should use the DateTime property, but I havent figured out how to make Data Mapper format the date as I wanted.)_

#### The Sinatra Web Application

This is an extremely simple implementation of a Sinatra Web Application.  It provides an index page, a search page for search results, a route for articles (/permalink), a 404 page and 500 error page.  

{% highlight ruby %}
require 'sinatra'
require './model.rb'

class ExitStatusOne < Sinatra::Base

  get '/' do
    @content = Content.all(:order => [ :created_at.desc ], :limit => 10) 
    erb :index
  end 
  
  get '/search' do
    @results = Content.all(:title.like => "%#{params[:query]}%" ) | 
               Content.all(:body.like => "%#{params[:query]}%" )
    erb :search
  end 

  get '/:permalink' do
    @content = Content.first(:permalink => params[:permalink]) || halt(404)
    erb :article
  end 

  not_found do
    erb :'404'
  end 

  error do
    erb :'505'
  end 
end
{% endhighlight %}

The search page reads all records in the database and pulls out any news article by title and body that matches the keyword in the query.

#### Thin Web Server

In order to serve up the web site I used Thin web server.  To launch Thin I used [Rack](http://rack.github.io/) to configure the properties to launch Thin.  This is a pretty standard set up for Thin.

Here is my Rack configuration file.  Its very minimal currently, and is stored in the file _config.ru_.

{% highlight ruby %}
require './exitstatusone'

#\ -p 4567

run ExitStatusOne
{% endhighlight %}

#### Views

I will not be listing the views because this post is already very lengthy.  The views is very similar to Ruby on Rails.  You can find information about Sinatra views [Here](http://www.sinatrarb.com/intro.html#Views%20/%20Templates).

***

Sinatra is by far my favorite web application framework even though it is mostly a micro framework.  The part I like most about Sinatra is how easy it is to get a basic web site up.  I also like the fact that you get a lot of freedom to make an application that is completely customized to your needs.   Sinatra also doesn't force you to follow conventions like other frameworks, specifically Ruby on Rails.
