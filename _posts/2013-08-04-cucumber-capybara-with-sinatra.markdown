---
layout: post
title: "Cucumber, Capybara and Sinatra"
date: 2013-08-04
description: "Basic usage of Cucumber and Capybara.  Explaining how it will simplify your software development process in web applications."
category: sinatra
comments: yes
---

Simply put, [Behaviour Driven Development](http://en.wikipedia.org/wiki/Behavior-driven_development) is the process of building a software from the Outside - In while providing software testing and basic documentation.  Creating a web application, or any program for that matter, from the outside-in, simplifies the process of developing software.  The process of software development always starts with communication between a consumer and a software developer to formulate a model.  Typically programmers have to find a way to describe technial programming jargon to consumers in order to explain how a piece of software will be developed.

Using Behaviour Driven Development bridges that gap by allowing the programmer and the consumer to sit down together and write a story.  A story about how both parties wish to express what their software will do and how it will do it.  In the BDD story, consumers have every say in how their software will be built.  In addition, programmers can then convert this story into actual programming code.  Furthermore, the story can be used to do software testing prior to writing a single piece of code. Essentially, BDD bridges the gap between programmers and non-programmers, allowing for fast-paced software development, while everyone involved knows exactly what the result will be for the final product.

For this article I will be refering to my previous article discussing a [Basic Sinatra Blog](http://exitstatusone.com/sinatra-simple-blog/).  I will show you how to use two tools: Cucumber and Capybara.  With these two tools, I will be able to test the back end code as well as the front end of my web application.


_Please note, in order to follow along, you will need ruby 1.9+, rubygems and the ability to install Capybara and Cucumber._

*  [Installation instructions for Capybara](http://jnicklas.github.io/capybara/)  (scroll down the page a little)
*  [Installation instructions for Cucumber](https://github.com/cucumber/cucumber/wiki/Install)

#### Capybara

Before I delve into the development process, let me introduce [Capybara](http://jnicklas.github.io/capybara/).  Capybara is a library written in Ruby that allows you to simulate how your web application front end interacts with a user.  With this tool you will be able to run your software testing without ever having opened a web browser.  It will save you a lot of time while building your application, and later on you can do manual testing to assure your site interacts according to your automated tests.

Please see the [Capybara RDoc](http://rubydoc.info/github/jnicklas/capybara/master) for information regarding usage, syntax and how Capybara can be applied. Later in the article I will have a few examples of how I used Capybara to automate the testing of my web application.

#### Cucumber

[Cucumber](http://cukes.info/): "Cucubmer, behaviour driven development with elegance and joy."

When I first read about Cucumber, I realized how effective this tool would be almost immediately.  When beginning to use Cucumber, it takes a bit of getting used to.  Seeing as I have never really taken on a large software development project, I can only guess that acclimating to a tool like Cucumber could be awkward at first.  Once you take an in-depth look at Cucumber, you will understand the benefits this form of software development offers.

***

#### The Beginning

The Cucumber story of my software begins by describing a Feature which is followed by Scenario cases where the Feature is applied.  Following my previous article regarding a [Basic Sinatra Blog](http://exitstatusone.com/sinatra-simple-blog/), I will show how I created the Feature I used to decide how I would display articles within the web application. 

#### The Feature

The following is the Feature I added:
{% highlight ruby %}
  Feature: View Articles
      In order to view articles
      As a user
      I must visit the home page
      And click a link to view an aritlce
      Then the article will be displayed
{% endhighlight %}
The feature block is the most important portion of the story.  It describes the Feature you are going to implement in entirety.  It is important to keep it short and to the point in order to clearly express what you intend to do.  A description any longer than a few lines probably means you need to split your feature up into separate features.

#### The Background

The Background is a block that sets the background of the feature. (Obviously) In my case this backround assures that each scenario has a news aritlce in the database to test against.  Backgrounds are not required, but in my case, I plan to add many many more scenarios in the future to test how and where News Articles are viewed throughout the blog. The Background allows reference to a created Article without having to repeat myself while developing the web application.

{% highlight ruby %}
  Background:  Create news article
    Given I create a news article named "Hello World"
    Then I should be able to find the article "Hello World"
{% endhighlight %}

Essentially, I create the article and do a quick query against the database to assure the inserted article did in fact get saved to the database.

#### The Scenario

A scenario is a small part of how you intend to fully implement the feature.  In your scenarios, it is a good idea to keep your written text as flowing as possible.

For example, I decided that I wanted to start on the Home Page.  Yes, in second scenario I repeat myself on the first line to state I am on the "/" (Root or Home Page) of my application.  By doing so I save myself the hastle of having to write more programing code to express that I am on the home page.  This is important to think about when you begin to write your step definitions.  _More on step definitions later in this post._

{% highlight  ruby %}
  Scenario:  Display the last 10 news articles on home page
    Given I am on the site page "/" 
    Then I should be able to see "Recent Posts"
    And the first article named "Hello World"
{% endhighlight %}

I think this block speaks for itself.  However the second line (Then ...) describes that I will see a heading on the Home page named "Recent Posts".  The third states I will see another heading named "Hello World" which is the name of the news article I inserted in the Background block above.  This allows the code to establish where to begin evaluating the Feature.  As I continue to write my Scenarios, I am adding more and more to the story of how I want my application to function.

{% highlight  ruby %}
  Scenario: Click the link to go to view an article
    Given I am on the site page "/" 
    Then I should see "View Article" in a link
    And I should click the link "View Article"
    Then I should see "Hello World"
{% endhighlight %}

Again, this Scenario is self explanatory, maybe even more so than the previous.  See how the story is building on itself?  As I write more and more, notice how the story develops into a detailed representation of the Feature.  This is sort of like writting an essay in school! Gasp, not that again.

#### Where, What, How?

So I have my text file expressing the feature.  Where do I put the feature?  What do I name it? and How is it applied to the testing and the expanding of my code base?

I will tell you:

1.  I first create a folder where my project will be kept, called "exitstatusone."
2.  Next I create the folder named "feature" within my project folder.
3.  Within the "feature" folder I create two additional folders:  "support" and "step_definitions"
4.  I then save the Feature in the feature folder, naming it "article.feature."

Next I will need to configure my development environment to ask Capybara to test the front end of my web application (the web page in the web browser).  In the support folder I created for Cucumber, I will add a file called env.rb. In this file I will insert the following:

{% highlight ruby %}

require File.join(File.dirname(__FILE__), '..', '..', 'exitstatusone')
require 'capybara'
require 'capybara/cucumber'

Capybara.app = ExitStatusOne

{% endhighlight %}

1.  Where File.join points to the name of my application.  i.e exitstatusone is my project code named exitstatusone.rb within my project folder.
2. Capybara is loaded
3. Cucumber is loaded
4. Capybara.app equals the name of my application.

#### Is Everything Set Yet???

Of course, it is all set.  Everything is in place to run Cucumber and have Capybara find each element on the page.  It is time to run Cucumber and begin developing the web application.

_Remember, we are following the article [Basic Sinatra Blog](http://exitstatusone.com/sinatra-simple-blog/).  In that article I show a listing of my database model.  Refer to that in order to understand the code behind how I created the news article.  We wont go into detail on how Data Mapper works, that is for an entirely different article at a later time. =)_

#### Step Definitions

Step Definitions are the code that helps Cucumber find and execute your code within your web application code.  Each feature will have a corresponding file located in the "step_definitions" folder.  In this example, my feature is called "articles.feature" and it is located within the "feature" folder.  In order to implement my step definition I will need to create ruby file that contains the output of Cucumber.  Let me execute Cucumber and check the output.

{% highlight ruby %}
alk3@exitstatusone:~/Learn/Sinatra/Projects/tutorial$ cucumber
Feature: View Articles
  In order to view articles
  As a user
  I must visit the home page
  And click a link to view an aritcle
  Then it will be displayed

  Background: Create news article                           # features/articles.feature:8
    Given I create a news article named "Hello World"       # features/articles.feature:9
    Then I should be able to find the article "Hello World" # features/articles.feature:10

0 scenarios
2 steps (2 undefined)
0m0.002s

You can implement step definitions for undefined steps with these snippets:

Given(/^I create a news article named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be able to find the article "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
{% endhighlight %}

This shows the output of the Feature, how long it took to run, how many steps there are and how to run the code.

I will now create my step definition.  I will name it articles.rb, put it in the "step_definitions" folder, and copy the suggested code snippets Cucumber gives me into that file.  I will then run Cucumber again.

{% highlight ruby %}
alk3@exitstatusone:~/Learn/Sinatra/Projects/tutorial$ cucumber
Feature: View Articles
  In order to view articles
  As a user
  I must visit the home page
  And click a link to view an aritcle
  Then it will be displayed

  Background: Create news article                           # features/articles.feature:8
    Given I create a news article named "Hello World"       # features/step_definitions/articles.rb:1
      TODO (Cucumber::Pending)
      ./features/step_definitions/articles.rb:2:in `/^I create a news article named "(.*?)"$/'
      features/articles.feature:9:in `Given I create a news article named "Hello World"'
    Then I should be able to find the article "Hello World" # features/step_definitions/articles.rb:5

0 scenarios
2 steps (1 skipped, 1 pending)
0m0.002s
{% endhighlight %}

Sweet.  Now all I need to do is add the appropriate code to make my steps pass and to implement the first portion of my Feature.  I will add the following code into the articles.rb file located in the "step_definitions" folder.

{% highlight ruby %}
Given(/^I create a news article named "(.*?)"$/) do |arg1|
  body = "Welcome to my web site.  This is the first post.  Keep checking back."
  article = Content.first_or_create(
    :title => arg1,
    :body => body,
    :permalink => 'hello-world',
    :author => 'Mr Alk3',
    :category => 'News',
    :created_at => Time.now.strftime("%m-%d-%Y")
    )   
  article.save
end

Then(/^I should be able to find the article "(.*?)"$/) do |arg1|
  find = Content.first(:title.like => "%#{arg1}%")
end
 {% endhighlight %}

Great, let me run Cucumber and check the output.  Hopefull everything passes and we can move onto creating a Scenario.

{% highlight ruby %}
alk3@exitstatusone:~/Learn/Sinatra/Projects/tutorial$ cucumber
Feature: View Articles
  In order to view articles
  As a user
  I must visit the home page
  And click a link to view an aritcle
  Then it will be displayed

  Background: Create news article                           # features/articles.feature:8
    Given I create a news article named "Hello World"       # features/step_definitions/articles.rb:1
    Then I should be able to find the article "Hello World" # features/step_definitions/articles.rb:14

0 scenarios
2 steps (2 passed)
0m0.017s
{% endhighlight %}

Excellent.  Now it is time to add a Scenario.  As stated previously, I want to add a scenario that displays 10 of the most recent news articles on the home page.  Lets add that scenario:

{% highlight ruby %}
alk3@exitstatusone:~/Learn/Sinatra/Projects/tutorial$ cucumber
Feature: View Articles
  In order to view articles
  As a user
  I must visit the home page
  And click a link to view an aritcle
  Then it will be displayed

  Background: Create news article                           # features/articles.feature:8
    Given I create a news article named "Hello World"       # features/step_definitions/articles.rb:1
    Then I should be able to find the article "Hello World" # features/step_definitions/articles.rb:14

  Scenario: Display the last 10 news articles on home page  # features/articles.feature:12
    Given I am on the site page "/"                         # features/articles.feature:13
    Then I should be able to see "Recent Posts"             # features/articles.feature:14
    And the first article named "Hello World"               # features/articles.feature:15

1 scenario (1 undefined)
5 steps (3 undefined, 2 passed)
0m0.015s

You can implement step definitions for undefined steps with these snippets:

Given(/^I am on the site page "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be able to see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the first article named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
{% endhighlight %}

Ok, once again, let me add the code snippets and then add in the ruby code that will check for the heading "Recent Posts" and find the article "Hello World."

{% highlight ruby %}
Given(/^I am on the site page "(.*?)"$/) do |arg1|
  visit(arg1)
end

Then(/^I should be able to see "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end

Then(/^the first article named "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end
{% endhighlight %}

This bit of code makes use of Capybara.  visit(arg1), tells Cucumber to use Capybara to visit the Home Page, as described in the Scenario.  Then Capybara checks if the page has the words described as well.  If all goes well, the step definition should pass.  I will run Cucumber again:

{% highlight ruby %}
alk3@exitstatusone:~/Learn/Sinatra/Projects/tutorial$ cucumber
Feature: View Articles
  In order to view articles
  As a user
  I must visit the home page
  And click a link to view an aritcle
  Then it will be displayed

  Background: Create news article                           # features/articles.feature:8
    Given I create a news article named "Hello World"       # features/step_definitions/articles.rb:1
    Then I should be able to find the article "Hello World" # features/step_definitions/articles.rb:14

  Scenario: Display the last 10 news articles on home page  # features/articles.feature:12
    Given I am on the site page "/"                         # features/step_definitions/articles.rb:19
    Then I should be able to see "Recent Posts"             # features/step_definitions/articles.rb:23
    And the first article named "Hello World"               # features/step_definitions/articles.rb:27

1 scenario (1 passed)
5 steps (5 passed)
0m0.143s
{% endhighlight %}

***

At this point you should get the basic idea of how to utilize Cucumber and Capybara to develop Sinatra based Web Applications.  The process to develop Ruby on Rails applications is nearly the same, minus a few things here and there.  Hopefully, this article was not too confusing and it is easy to follow- it is quite detailed for such a basic application.  I also hope that you find the value in using Cucumber and Capybara to develop web applications.