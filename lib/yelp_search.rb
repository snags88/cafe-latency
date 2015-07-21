require 'yelp'

class YelpSearch

  attr_accessor :client, :limit, :offset

  def initialize
    @client = Yelp::Client.new({ consumer_key: ENV["YELP_CONSUMER_KEY"],
                                 consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                                 token: ENV["YELP_TOKEN"],
                                 token_secret: ENV["YELP_TOKEN_SECRET"]
                              })
  end

  def search
    params = { term: 'cafe',
               limit: 3,
               offset: 1
             }
    hash = @client.search('New York', params);
  end

end





