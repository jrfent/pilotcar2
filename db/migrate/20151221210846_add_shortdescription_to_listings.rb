class AddShortdescriptionToListings < ActiveRecord::Migration
  def change
        add_column :listings, :shortdescription, :string
  end
end
