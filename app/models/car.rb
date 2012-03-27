class Car < ActiveRecord::Base
 # ensures that registration number is unique and present 
 validates :reg, :uniqueness => true, :presence => true 
 
 # VALIDATES: model is present
 validates :model, :presence => true
 
 # VALIDATES: car_class_id is present
 validates :car_class_id, :presence => true, :numericality => true

 # car belongs to booking
 belongs_to :booking

 # car belongs to car_class
 belongs_to :car_class

end
