class Booking < ActiveRecord::Base
has_many :payements
has_one :car
belongs_to :user
belongs_to :customer

attr_accessor :car_class

validates :address_one, :presence => true, :if => Proc.new { |o| o.collect != true }
validates :city, :presence => true, :if => Proc.new { |o| o.collect != true }
validates :postcode, :presence => true, :if => Proc.new { |o| o.collect != true}
validates :date_of_departure, :date => {:after => Time.now - 1.day, :before => Time.now + 1.year}
validates :date_of_arrival, :date => {:after => :date_of_departure, :before => Time.now + 1.year}
end