require 'twilio-ruby'

class Texting
account_sid = 'ACe330ba04d082392df4cb3511dcb72cec'
auth_token = '2008ea097713e401a16c54029058da82'
@client = Twilio::REST::Client.new(account_sid, auth_token)
@client.account.messages.create(
  :from => '+18152642023',
  :to => '+19178036744',
  :body => 'Hey Vorm!'
)
end

test = Texting.new
