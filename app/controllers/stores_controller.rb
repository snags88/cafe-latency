class StoresController < ApplicationController
  def search
    name = params[:name]
    location = params[:location]

    @stores = Store.where('name LIKE ?', ["%#{name}%"])
  end

  def index
  end

  def show
    @store = Store.find(params[:id])
  end
end
