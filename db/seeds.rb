counter = 0

while counter <= 200
  yelp_search = YelpSearch.new(
                            :term => "cafe",
                            :limit => 20,
                            :offset => counter,
                            :location => "New York",
                            :category => "cafe"
                           )

  yelp_search.overall_list.each do |cafe|
    Store.create(
                :name => cafe.name,
                :uid => cafe.id,
                :url => cafe.url,
                :rating => cafe.rating,
                :address => cafe.location.address.first,
                :city => cafe.location.city,
                :postal_code => cafe.location.postal_code,
                :state_code => cafe.location.state_code
              )
  end
  counter += 20
end

