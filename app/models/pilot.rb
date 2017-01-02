class Pilot < ActiveRecord::Base
  has_many :bids, dependent: :destroy
  has_many :loads, through: :bids, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :pins, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
         
end
