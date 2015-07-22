class RemoveNeighborhoodAndDisplayaddressFromStore < ActiveRecord::Migration
  def change
    remove_column :stores, :neighborhood, :string
    remove_column :stores, :display_address, :string
  end
end
