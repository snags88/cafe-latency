class AddNeighborhoodToStore < ActiveRecord::Migration
  def change
    add_column :stores, :neighborhoods, :text, array: true, default: []
  end
end
