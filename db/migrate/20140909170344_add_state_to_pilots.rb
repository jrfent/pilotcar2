class AddStateToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :state, :string
    add_index :pilots, :state
  end
end
