class AddContactPhoneToTruckers < ActiveRecord::Migration
  def change
    add_column :truckers, :contact_phone, :string
  end
end
