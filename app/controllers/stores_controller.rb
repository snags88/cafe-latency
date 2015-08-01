class StoresController < ApplicationController
  def search
    location = params[:location]
    name = params[:name]

    if name.empty?
      neighborhood = SearchLocation.where(:name => (location + " New York")).first
      @stores = Store.near([neighborhood.latitude, neighborhood.longitude], 1.5)
    elsif location.empty?
      @stores = Store.find_by_fuzzy_name(name)
    else
      neighborhood = SearchLocation.where(:name => (location + " New York")).first
      result = Store.find_by_fuzzy_name(name).first
      @stores = result.nearbys(1)
      @stores.unshift(result)
    end
  end

  def index
  end

  def show
    @store = Store.find(params[:id])
  end
end
