class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :fee
      t.integer :pilot_id
      t.integer :load_id
      t.belongs_to :pilot
      t.belongs_to :load

      t.timestamps
    end
    add_index :bids, :pilot_id
    add_index :bids, :load_id
  end
end
