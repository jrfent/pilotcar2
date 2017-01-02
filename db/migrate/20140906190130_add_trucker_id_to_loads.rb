class AddTruckerIdToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :trucker_id, :integer
    add_index :loads, :trucker_id
  end
end
