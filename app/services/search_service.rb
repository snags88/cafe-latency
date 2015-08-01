class SearchService
  attr_accessor :name, :location, :stores

  def initialize(params)
    @name = params[:name]
    @location = params[:location]
  end

  def check_parameters
    if @name.empty?
      neighborhood = SearchLocation.find_using(@location)
      @stores = Store.near([neighborhood.latitude, neighborhood.longitude], 1.5)
    elsif @location.empty?
      @stores = Store.find_by_fuzzy_name(@name)
    else
      neighborhood = SearchLocation.find_using(@location)
      result = Store.find_first_fuzzy(@name)
      @stores = result.nearbys(1.5)
      @stores.unshift(result)
    end
  end
end

