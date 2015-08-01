class StoresController < ApplicationController
  def search
    search_result = search_service
    search_result.check_parameters
    @stores = search_result.stores
    if @stores == nil
      flash[:notice] = "Both fields can not be blank!"
      redirect_to root_path
    elsif @stores == "invalid location"
      flash[:notice] = "Invalid location!"
      redirect_to root_path
    end
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
