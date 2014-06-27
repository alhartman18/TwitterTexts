require 'pry'
require 'nokogiri'
require 'open-uri'
require 'twilio-ruby'


class Tweets 

def initialize(twitter_account)
    @twitter_account = Nokogiri::HTML(open("#{twitter_account}"))
    @full_name = self.scrape_full_name
    @twitter_handle = self.scrape_twitter_handle
    @tweet_time = self.scrape_tweet_time
    @tweet_text = self.scrape_tweet_text
    @tweet_image = self.scrape_tweet_image
    @hashtags_and_handles = self.scrape_hashtags_and_handles
    @tweet_link = self.scrape_tweet_link
end
    
def scrape_full_name
    @twitter_account.css(".ProfileTweet-fullname").first.children.text
end

def full_name
    @full_name 
end

def scrape_twitter_handle
    @twitter_account.css("span.u-linkComplex-target").first.children.text
end

def twitter_handle
    @twitter_handle 
end

def scrape_tweet_time
    @twitter_account.css("span.js-short-timestamp").first.attributes["data-time"].value
    # if :tweet_time/60 >= 60
    #     :tweet_time/3600 + "hours"
    # elsif :tweet_time/60 < 1
    #     :tweet_time/3600/60 + "seconds"
    # else 
    #     :tweet_time/60 + "minutes"
    # end
end

def tweet_time
    @tweet_time 
end

def scrape_tweet_text
    @twitter_account.css(".ProfileTweet-text").first.children.text.strip
end

def tweet_text
    @tweet_text 
end

def scrape_tweet_image
    image = @twitter_account.css(".StreamItem").first.css(".TwitterPhoto-mediaSource")
    if image.length > 0
        image[0]["src"]
    end
end

def tweet_image
    @tweet_image 
end

def scrape_hashtags_and_handles
    h_and_h = []
    @twitter_account.css(".StreamItem").first.css(".twitter-atreply, .twitter-hashtag").each do |bagel|
        h_and_h << bagel["href"]
    end
    h_and_h

end

def hashtags_and_handles
    @hashtags_and_handles 
end
    
def scrape_tweet_link
    @twitter_account.css("span.js-display-url").first.text
end

def tweet_link
    @tweet_link  
end


end


# info = {
#   :tweet_time => twitter.css("span.js-short-timestamp").first.attributes["data-time"].value,
#   :tweet_text => twitter.css(".ProfileTweet-text").first.children.text,
#   :twitter_handle => twitter.css(".ProfileTweet-screenname").first.text.strip,
#   :full_name => twitter.css(".ProfileTweet-fullname").last.children.text,
#   :hashtags_and_handles => twitter.css(".ProfileTweet-text").first.css("a").collect do |link|
#                                   "twitter.com#{link["href"]}" 
#                           end,
#   :tweet_image =>
# }end 


