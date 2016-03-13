class AddLocate < ActiveRecord::Migration
  def change
    create_table :currentLocation do |t|
      t.string :current
    end
  end
end
