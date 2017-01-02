class AddAdminToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :admin, :boolean
  end
end
