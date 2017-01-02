class AddContactPhoneToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :contact_phone, :string
  end
end
