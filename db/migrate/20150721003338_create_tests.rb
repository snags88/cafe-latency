class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :store, index: true
      t.float :download
      t.float :upload
      t.float :latency
      t.float :jitter
      t.string :test_server
      t.string :ip_address
      t.string :host_name

      t.timestamps null: false
    end
    add_foreign_key :tests, :stores
  end
end
