class CreateAlerts < ActiveRecord::Migration[6.1]
  def change
    create_table :alerts do |t|
      t.string :name
      t.integer :city_origin_id
      t.string :city_origin_name
      t.string :city_origin_url_name
      t.integer :city_destination_id
      t.string :city_destination_name
      t.string :city_destination_url_name
      t.integer :bus_class
      t.integer :price

      t.timestamps
    end
  end
end
