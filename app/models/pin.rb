class Pin < ActiveRecord::Base
  belongs_to :listing
  belongs_to :pilot
  has_attached_file :image, :styles => { :large => "650x650", :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
