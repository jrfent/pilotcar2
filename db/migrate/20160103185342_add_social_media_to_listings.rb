class AddSocialMediaToListings < ActiveRecord::Migration
  def change
    add_column :listings, :cellphone, :string
    add_column :listings, :fax, :string
    add_column :listings, :website, :string
    add_column :listings, :blog, :string
    add_column :listings, :facebook, :string
    add_column :listings, :twitter, :string
    add_column :listings, :instagram, :string
    add_column :listings, :pinterest, :string
    add_column :listings, :google, :string
  end
end
