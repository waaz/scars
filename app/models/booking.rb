class Booking < ActiveRecord::Base
has_many :payements      # A booking has many payments
belongs_to :car          # A Booking has one car
belongs_to :user         # A Booking Belongs to a User
belongs_to :customer     # A Booking Belongs to a customer

attr_accessor :car_class #creates necessary methods to get and set the car_class instance variable

#VALIDATE: user_id is present and is numerical 
validates :user_id, :presence => true, :numericality => true

 

#VALIDATES: the presence of address information if the user requires delivery
validates :address_one, :presence => true, :if => Proc.new { |o| o.collect != true }
validates :city, :presence => true, :if => Proc.new { |o| o.collect != true }
validates :postcode, :presence => true, :if => Proc.new { |o| o.collect != true}

#VALIDATES: the format of the postcode using a REGEX provided by the government,   
#validates_as_uk_postcode :postcode, :if => Proc.new { |o| o.collect != true }

#VALIDATES: date of departure is after today and no further in the future than 1 year
validates :date_of_departure, :date => {:after => Time.now - 1.day, :before => Time.now + 1.year}

#VALIDATES: date_of_arrival is after the date_of)departure and no further in the future than 1 year
validates :date_of_arrival, :date => {:after => :date_of_departure, :before => Time.now + 1.year}

#VALIDATES: presence and numericality of car_id
validates :car_id, :presence => true, :numericality => true
end