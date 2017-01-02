class AddAddressLine1ToTruckers < ActiveRecord::Migration
  def change
    add_column :truckers, :address_line1, :string
  end
end
