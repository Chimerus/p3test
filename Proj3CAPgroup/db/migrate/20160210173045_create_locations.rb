class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location_name
      t.string :address
      t.string :default_transport

      t.timestamps null: false
    end
  end
end
