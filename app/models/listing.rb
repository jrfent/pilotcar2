class Listing < ActiveRecord::Base
  
  belongs_to :category
  belongs_to :subcategory 
  belongs_to :pilot
  has_many   :notifications
  has_many   :pins
  validates  :pilot_id, presence: true
  validates :slug, uniqueness: true, presence: true,
                   exclusion: {in: %w[signup login]}
                   
  before_validation :generate_slug
  
  geocoded_by :full_address
  after_validation :geocode
  
  def full_address
    [city, state, zipcode].join(', ')
  end
  
  def self.search(params)
    listings = Listing.all
    listings = listings.where("title ilike ? OR description ilike ? OR shortdescription ilike ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    listings = listings.near(params[:location], 75) if params[:location].present?
    listings
  end
  
  def to_param
    slug
  end

  def generate_slug
    self.slug ||= "#{city}-#{state}-#{title}".parameterize
  end
  
end

