class ChangeFeeOnBidsToPrecise < ActiveRecord::Migration
  def self.up
   change_column :bids, :fee, :decimal, precision: 5, scale: 2
  end
  def self.down
   change_column :bids, :fee, :integer
  end
end
