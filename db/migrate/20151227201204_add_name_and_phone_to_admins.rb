class AddNameAndPhoneToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :contact_name, :string
    add_column :admins, :contact_phone, :string
  end
end
