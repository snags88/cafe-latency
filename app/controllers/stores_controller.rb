class StoresController < ApplicationController
  def search
    search_result = search_service
    search_result.check_parameters
    @stores = search_result.stores
  end

  def index
  end

  def show
    @store = Store.find(params[:id])
  end

  private

  def search_service
    SearchService.new({
      location: params[:location],
      name: params[:name]
      })
  end
end
