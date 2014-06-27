require 'twilio-ruby'
require 'open-uri'
require_relative './lib/messaging.rb'
require_relative './lib/scraping.rb'
require 'nokogiri'

#scrape twitter
    #create a new instance of my Tweets class
    
#grab  the most recent tweet and all of its data
#becuase this task is going to be scheduled for every 10 minutes, we want to see if most recent tweet happened
    #less than 10 min ago
#if most recent tweet is from less than 10 min ago
#trigger sending my text message
task :tweeter do
    @tweet = Tweets.new("https://www.twitter.com/GovernorPerry")
    time_of_tweet = Time.at(@tweet.tweet_time.to_i)
    if time_of_tweet > Time.now-10*60
        text_to_send = Texting.new
        text_to_send.send_text("+18152642023", "+16465316872")
    end
end



