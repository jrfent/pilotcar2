class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.string :origin_country
      t.string :origin_city
      t.string :origin_state
      t.string :origin_zipcode
      t.string :destination_country
      t.string :destination_city
      t.string :destination_state
      t.string :destination_zipcode
      t.integer :fee
      t.string :fee_type
      t.integer :distance
      t.datetime :pickup_datetime
      t.datetime :delivery_datetime
      t.text :special_notes
      t.integer :pilotcar_count
      t.boolean :polecar_needed
      t.string :current_status

      t.timestamps
    end
    add_index :loads, :origin_country
    add_index :loads, :origin_city
    add_index :loads, :origin_state
    add_index :loads, :origin_zipcode
    add_index :loads, :destination_country
    add_index :loads, :destination_city
    add_index :loads, :destination_state
    add_index :loads, :destination_zipcode
    add_index :loads, :pickup_datetime
    add_index :loads, :delivery_datetime
  end
end
