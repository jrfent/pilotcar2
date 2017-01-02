class AddContactNameToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :contact_name, :string
  end
end
