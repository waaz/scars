class Accident < ActiveRecord::Base
	belongs_to :cars
	accepts_nested_attributes_for :cars
	
	
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :address_line_1, :presence => true
	validates :address_line_2, :presence => true
	validates :postcode, :presence => true
	validates :email, :presence => true
	validates :phone, :presence => true
	validates :reg, :presence => true
	validates :model, :presence => true
	validates :damage_report, :presence => true
	validates :accident_report, :presence => true
end
