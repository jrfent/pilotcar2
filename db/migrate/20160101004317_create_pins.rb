class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :description
      t.integer :pilot_id
      t.integer :listing_id
    end
    add_index :pins, :pilot_id
    add_index :pins, :listing_id
  end
end
