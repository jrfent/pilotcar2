class Load < ActiveRecord::Base
    belongs_to :trucker 
    has_many :bids
    has_many :pilots, through: :bids
    
    validates :pickup_datetime,
              date: { after: Proc.new { 1.day.ago }, message: 'must be after current date/time'}  
                      
    validates :delivery_datetime,
              date: { after: :pickup_datetime, message: 'must be after pick up date/time' } 
              
    validates_format_of :origin_zipcode, :with => /^\d{5}(-\d{4})?$/, :multiline => true,
                        :message => "should be in the form 12345 or 12345-1234"          
              
    validates_format_of :destination_zipcode, :with => /^\d{5}(-\d{4})?$/, :multiline => true,
                        :message => "should be in the form 12345 or 12345-1234"                                              
end
