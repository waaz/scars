class Accident < ActiveRecord::Base
	belongs_to :cars
	accepts_nested_attributes_for :cars
end
