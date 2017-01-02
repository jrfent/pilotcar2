class AddStateToTruckers < ActiveRecord::Migration
  def change
    add_column :truckers, :state, :string
    add_index :truckers, :state
  end
end
