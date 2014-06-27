require 'twilio-ruby'
require_relative './scraping.rb'


class Texting
    
    def send_text(sender, recipient)
        account_sid = 'ACe330ba04d082392df4cb3511dcb72cec'
        auth_token = '2008ea097713e401a16c54029058da82'

        texter_tweet = Tweets.new("https://www.twitter.com/GovernorPerry")

        @client = Twilio::REST::Client.new(account_sid, auth_token)
        @client.account.messages.create(
          :from => sender,
          :to => recipient,
          :body => "#{texter_tweet.full_name} (@#{texter_tweet.twitter_handle}) tweeted #{Time.at(texter_tweet.tweet_time.to_i)-Time.now.to_i/60} minutes ago:
        
        #{texter_tweet.tweet_text} 
        #{texter_tweet.tweet_image}
        #{texter_tweet.hashtags_and_handles}
        
        See this account here:
          https://www.twitter.com/#{texter_tweet.twitter_handle}"

        )
    end
end

# test = Texting.new
# test.send_text(+18152642023, +19178036744, "Hi Vorm!")
 

