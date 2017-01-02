class AddZipcodeToTruckers < ActiveRecord::Migration
  def change
    add_column :truckers, :zipcode, :string
    add_index :truckers, :zipcode
  end
end
