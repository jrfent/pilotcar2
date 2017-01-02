class Bid < ActiveRecord::Base
  belongs_to :pilot
  belongs_to :load
  
end
