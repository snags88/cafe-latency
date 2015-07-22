require 'yelp'

class YelpSearch

  attr_accessor :client, :limit, :offset, :location, :term, :result_hash

  def initialize(args)
    @term  = args[:term]
    @limit = args[:limit]
    @offset = args[:offset]
    @location = args[:location]
    @category = args[:category]
    @client = Yelp::Client.new({ consumer_key: ENV["YELP_CONSUMER_KEY"],
                                 consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                                 token: ENV["YELP_TOKEN"],
                                 token_secret: ENV["YELP_TOKEN_SECRET"]
                              })
  end

  def overall_list
    params = { term: @term,
               category: @category,
               limit: @limit,
               offset: @offset
             }
    @result_hash = @client.search(@location, params).businesses;
  end

end



