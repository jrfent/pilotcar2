class AddCompanyToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :company, :string
    add_index :pilots, :company
  end
end
