---
  tags: scraping, nokogiri, oop, rake, sinatra, kids
  languages: ruby
---

#Sinatra For Scraping

#This is a Sinatra boilerplate to get a data-messaging pattern application deployed to heroku. 

#Sinatra is a ruby gem that provides a very light-weight framework for building deploying ruby applications. You can read all about Sinatra [here](http://www.sinatrarb.com/). 

You'll notice a bunch of different files and folders in this directory.

The `lib` directory is where most of your ruby logic goes. It's where all your files with defined classes with go. There are already `messaging.rb` and `scraping.rb` files in that directory. Those files are where you will copy and paste your similiarly named files from the scraping-with-messaging lab. You will also copy and paste the contents of you `Rakefile` from that lab in the Rakefile provided here.

The point of this application is to focus on data-messaging, so we haven't really spent a lot of time on the frontend. Sinatra allows you to integrate the frontend and the backend.  In `index.html.erb` in the `views` directory is where you'll write your html. You'll notice a file called `index.html.erb` the `erb` extension means you can write Ruby in the html. You just wrap any of your ruby code around `<%= %>` tags. For example, `<%= @my_ruby_instance_variable %>`.

`app.rb` is where your logic would go to pass your scraped data to `index.html.erb` in your `views`directory. If you wanted to display your scraped data in your class, you'd need to create a new instance inside the get block.

`config.ru` only needs to have information if you're using the mailgun gem. Ruby is based on convention of configuration. That means that once you know how Ruby works, you can pretty much do anything. There are a few things that require specific configurations. One of those things is SMTP. SMTP stands for Simple Mail Transfer Protocol. Just like HTTP is for the browser, SMTP is for sending emails.

If you are using MailGun, you're `config.ru` file should look like this:

```
require './app'
run Sinatra::Application

Mail.defaults do
  delivery_method :smtp, {
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :domain => localhost:9393,
    :user_name => your_mailgun_email_address,
    :password => your_mailgun_password,
    :authentication => 'plain',
    :enable_starttls_auto => true
  }
end
```

You would need to fill out the username and password with the ones provided by MailGun.

`Gemfile` is where you organize all the gems you're using. You'll notice there are a bunch already included. You will need to run `bundle install` in the directory of the lab in order to install the gems in the project. When you run that a `Gemfile.lock` will be automatically created. Don't delete that. It locks in all the proper versions of your gems for this particular project.

The `Procfile` is necessary for deploying the application to [Heroku](https://www.heroku.com/). Heroku is a cloud server that allows for easy git-integrated command line deployment.


