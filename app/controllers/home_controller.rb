class HomeController < ApplicationController
  
  def index
    config = {
        consumer_key:    "Mrob8koLQ3WYPE6RVADwOnnz4",
        consumer_secret: "wWnBOZr6138UnBwPVaB9iBJLMSV8nzCyvxk8CB8Wl2R9vOMRmP",
    }

    client = Twitter::REST::Client.new(config)

    @user_tweets = client.user_timeline('ResonateAU', count: 9)

    @tweets_html = {}
    @user_tweets.each do |a|
      @tweets_html[a.id] = client.oembed(a).html
    end

  end

end
