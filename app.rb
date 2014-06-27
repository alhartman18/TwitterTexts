require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require './lib/messaging'
require './lib/scraping'
require 'pry'


get '/' do
 @potatoes = Tweets.new("https://www.twitter.com/GovernorPerry")
 @time = Time.at(@potatoes.tweet_time.to_i)-Time.now.to_i/60
  #index.html.erb won't have access to your objects without it.
  erb :index #this tells your program to use the html associated with the index.html.erb file in your browser
end 

#http://localhost:9393/