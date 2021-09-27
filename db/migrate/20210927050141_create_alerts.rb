class CreateAlerts < ActiveRecord::Migration[6.1]
  def change
    create_table :alerts do |t|
      t.string :name
      t.string :city_origin
      t.string :city_destination
      t.integer :bus_class
      t.integer :price

      t.timestamps
    end
  end
end
