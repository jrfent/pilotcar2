class AddContactNameToTruckers < ActiveRecord::Migration
  def change
    add_column :truckers, :contact_name, :string
  end
end
