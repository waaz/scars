class Car < ActiveRecord::Base
validates :reg, :uniqueness => true, :presence => true
belongs_to :booking
belongs_to :car_class
end
