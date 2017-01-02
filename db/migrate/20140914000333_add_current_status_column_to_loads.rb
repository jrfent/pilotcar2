class AddCurrentStatusColumnToLoads < ActiveRecord::Migration
  def change
    add_column :loads, :current_status, :string, :default => "OPEN"
    add_index :loads, :current_status
  end
end
