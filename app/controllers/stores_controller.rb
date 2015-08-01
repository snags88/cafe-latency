class StoresController < ApplicationController
  def search
    location = params[:location]
    name = params[:name]

    if name.empty?
      neighborhood = SearchLocation.where(:name => (location + " New York")).first
      @stores = Store.near([neighborhood.latitude, neighborhood.longitude], 1.5)
    else
      neighborhood = SearchLocation.where(:name => (location + " New York")).first
      @stores = Store.near([neighborhood.latitude, neighborhood.longitude], 1.5).where(:name => params[:name])
    end
  end

  def index
  end

  def show
    @store = Store.find(params[:id])
  end
end
