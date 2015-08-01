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
    store = Store.create(
                :name => cafe.name,
                :uid => cafe.id,
                :url => cafe.url,
                :rating => cafe.rating,
                :address => cafe.location.address.first,
                :city => cafe.location.city,
                :postal_code => cafe.location.postal_code,
                :state_code => cafe.location.state_code
              )
    if cafe.location.respond_to?(:neighborhoods)
      store.update(:neighborhoods => cafe.location.neighborhoods)
    end
  end
  counter += 20
end

CITIES = ["Alphabet City New York",
"Astoria New York",
"Battery Park City New York",
"Bedford-Stuyvesant New York",
"Boerum Hill New York",
"Brooklyn Heights New York",
"Bushwick New York",
"Carroll Gardens New York",
"Chelsea New York",
"Chinatown New York",
"Civic Center New York",
"Clinton Hill New York",
"Cobble Hill New York",
"Crown Heights New York",
"Downtown Brooklyn New York",
"DUMBO New York",
"East Harlem New York",
"East Village New York",
"Financial District New York",
"Flatbush New York",
"Flatiron District New York",
"Flushing New York",
"Fort Greene New York",
"Gowanus New York",
"Gramercy Park New York",
"Greenpoint New York",
"Greenwich Village New York",
"Harlem New York",
"Hell's Kitchen New York",
"Hudson Square New York",
"Inwood New York",
"Jackson Heights New York",
"Kensington New York",
"Kips Bay New York",
"Lefferts Garden New York",
"Little Italy New York",
"Long Island City New York",
"Lower East Side New York",
"Meatpacking District New York",
"Midtown New York",
"Midtown East New York",
"Morningside Heights New York",
"Murray Hill New York",
"Noho New York",
"Nolita New York",
"Park Slope New York",
"Prospect Heights New York",
"Red Hook New York",
"Ridgewood New York",
"Soho New York",
"South Street Seaport New York",
"Times Square/Theatre District New York",
"Tribeca New York",
"Union Square New York",
"Upper East Side New York",
"Upper West Side New York",
"Washington Heights New York",
"West Village New York",
"Williamsburg New York",
"Windsor Terrac New York"]

CITIES.each do |city|
  coordinates = Geocoder.coordinates(city)
  SearchLocation.create(:name => city, :latitude => coordinates.first, :longitude => coordinates.last)
end




