class AddNoteToBids < ActiveRecord::Migration
  def change
    add_column :bids, :note, :text
    add_column :bids, :fee_type, :string
    add_column :bids, :confirm, :boolean
  end
end
