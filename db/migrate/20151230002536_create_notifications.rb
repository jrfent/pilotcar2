class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :content
      t.integer :listing_id
      t.integer :trucker_id
      
      t.timestamps
    end
    add_index :notifications, :listing_id
    add_index :notifications, :trucker_id
  end
end
