class AddAddressLine2ToTruckers < ActiveRecord::Migration
  def change
    add_column :truckers, :address_line2, :string
  end
end
