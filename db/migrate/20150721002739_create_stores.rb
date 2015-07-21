class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :uid
      t.string :url
      t.float :rating
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :neighborhood
      t.string :state_code
      t.string :display_address

      t.timestamps null: false
    end
  end
end
