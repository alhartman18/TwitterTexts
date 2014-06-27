require 'twilio-ruby'

class Texting

    def send_text(sender, recipient, body)
        account_sid = 'ACe330ba04d082392df4cb3511dcb72cec'
        auth_token = '2008ea097713e401a16c54029058da82'

        @client = Twilio::REST::Client.new(account_sid, auth_token)
        @client.account.messages.create(
          :from => sender,
          :to => recipient,
          :body => body
        )
    end
end

test = Texting.new
test.send_text(+18152642023, +19178036744, "Hey Vorm!")
