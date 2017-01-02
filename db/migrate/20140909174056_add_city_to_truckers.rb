class AddCityToTruckers < ActiveRecord::Migration
  def change
    add_column :truckers, :city, :string
    add_index :truckers, :city
  end
end
