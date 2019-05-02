class HomeController < ApplicationController
  
  def index
    config = {
        consumer_key:    Rails.application.config.api_key,
        consumer_secret: Rails.application.config.api_secret
    }

    client = Twitter::REST::Client.new(config)

    @user_tweets = client.user_timeline('ResonateAU', count: 9)

    @tweets_html = {}
    @user_tweets.each do |a|
      @tweets_html[a.id] = client.oembed(a).html
    end

  end

end
