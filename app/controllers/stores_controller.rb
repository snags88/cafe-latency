class StoresController < ApplicationController

  def search
    @stores = SearchService.new(store_params).execute
    if @stores == nil
      flash[:notice] = "Both fields can not be blank!"
      redirect_to root_path
    end
  end

  def index
  end

  def show
    @store = Store.find(params[:id])
    @current_ip = self.request.remote_ip
    @distance = @store.distance_to(@current_ip)
  end

  private

  def store_params
    params.require(:store).permit(:name, :location)
  end
end
