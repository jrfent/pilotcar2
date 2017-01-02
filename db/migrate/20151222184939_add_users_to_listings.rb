class AddUsersToListings < ActiveRecord::Migration
  def change
    add_column :listings, :pilot_id, :integer
    add_index :listings, :pilot_id
  end
end
