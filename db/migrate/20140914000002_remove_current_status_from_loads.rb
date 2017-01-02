class RemoveCurrentStatusFromLoads < ActiveRecord::Migration
  def change
    remove_column :loads, :current_status, :string
  end
end
