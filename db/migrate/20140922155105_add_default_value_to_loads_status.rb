class AddDefaultValueToLoadsStatus < ActiveRecord::Migration
  def up
    change_column :loads, :current_status, :string, :default => "ACTIVE"
  end

  def down
    change_column :loads, :current_status, :string, :default => "OPEN"
  end
end