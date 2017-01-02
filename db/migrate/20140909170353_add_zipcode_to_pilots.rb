class AddZipcodeToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :zipcode, :string
    add_index :pilots, :zipcode
  end
end
