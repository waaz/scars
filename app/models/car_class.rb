class CarClass < ActiveRecord::Base
 has_many :cars

 validates :car_class_name, :presence => true

 validates :description, :presence => true

 validates :tarrif, :presence => true 

 
end
