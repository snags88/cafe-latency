class AddLatitudeAndLongitudeToSearchLocation < ActiveRecord::Migration
  def change
    add_column :search_locations, :latitude, :float
    add_column :search_locations, :longitude, :float
  end
end
