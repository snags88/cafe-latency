class SearchService
  attr_accessor :name, :location, :stores

  def initialize(params)
    @name = params[:name]
    @location = params[:location]
  end

  def check_parameters
    if @location.empty? && @name.empty?
      @stores= nil
    elsif @name.empty?
      neighborhood = SearchLocation.find_using(@location)
      neighborhood == nil ?
        @stores = "invalid location" :
        @stores = Store.near([neighborhood.latitude, neighborhood.longitude], 1.5)
    elsif @location.empty?
      @stores = Store.find_by_fuzzy_name(@name)
    else
      neighborhood = SearchLocation.find_using(@location)
      if neighborhood == nil
        @stores = "invalid location" 
      else
        result = Store.find_by_fuzzy_name(@name)
        @stores = result.collect do |store|
          store if store.distance_from([neighborhood.latitude,neighborhood.longitude]) <= 1.5
        end.compact
      end
    end
  end
end

