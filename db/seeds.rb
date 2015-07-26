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

CITIES = ["Alphabet City",
"Astoria",
"Battery Park City",
"Bedford-Stuyvesant",
"Boerum Hill",
"Brooklyn Heights",
"Bushwick",
"Carroll Gardens",
"Chelsea",
"Chinatown",
"Civic Center",
"Clinton Hill",
"Cobble Hill",
"Crown Heights",
"Downtown Brooklyn",
"DUMBO",
"East Harlem",
"East Village",
"Financial District",
"Flatbush",
"Flatiron District",
"Flushing",
"Fort Greene",
"Gowanus",
"Gramercy Park",
"Greenpoint",
"Greenwich Village",
"Harlem",
"Hell's Kitchen",
"Hudson Square",
"Inwood",
"Jackson Heights",
"Kensington",
"Kips Bay",
"Lefferts Garden",
"Little Italy",
"Long Island City",
"Lower East Side",
"Meatpacking District",
"Midtown",
"Midtown East",
"Morningside Heights",
"Murray Hill",
"Noho",
"Nolita",
"Park Slope",
"Prospect Heights",
"Red Hook",
"Ridgewood",
"Soho",
"South Street Seaport",
"Times Square/Theatre District",
"Tribeca",
"Union Square",
"Upper East Side",
"Upper West Side",
"Washington Heights",
"West Village",
"Williamsburg",
"Windsor Terrac"]

CITIES.each do |city|
  coordinates = Geocoder.coordinates(city)
  SearchLocation.create(:name => city, :latitude => coordinates.first, :longitude => coordinates.last)
end




