class ChangePrecisionForFee2 < ActiveRecord::Migration
  def self.up
   change_column :loads, :fee, :decimal, precision: 5, scale: 2
  end
  def self.down
   change_column :loads, :fee, :decimal
  end
end
