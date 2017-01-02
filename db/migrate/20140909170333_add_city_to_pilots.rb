class AddCityToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :city, :string
    add_index :pilots, :city
  end
end
