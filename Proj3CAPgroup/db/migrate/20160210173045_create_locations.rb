class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location_name
      t.string :address
      # t.string :city
      # t.string :state
      # t.integer :zip
      # edit migration directly
      t.boolean :home
      t.boolean :work
      t.boolean :favorite
      t.string :default_transport

      t.timestamps null: false
    end
  end
end
