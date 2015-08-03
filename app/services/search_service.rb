class SearchService
  attr_accessor :name, :location, :stores

  def initialize(params)
    @name = params[:name]
    @location = params[:location]
  end

  def execute
    find_stores
  end

  private

  def find_stores
    if neighborhood = SearchLocation.find_using(@location)
      location_search = Store.near([neighborhood.latitude, neighborhood.longitude], 1.0)
    else
      location_search = []
    end

    name_search = Store.find_by_fuzzy_name(@name) if name_present?

    if location_present? && name_present?
      name_search & location_search
    elsif location_present?
      location_search
    elsif name_present?
      name_search
    end
  end

  def location_present?
    !@location.empty?
  end

  def name_present?
    !@name.empty?
  end
end

