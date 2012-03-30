class Accident < ActiveRecord::Base
	belongs_to :cars
	accepts_nested_attributes_for :cars
	
	#validation of accident form information 
	validates :first_name, :presence => true, :numericality => false
	validates :last_name, :presence => true, :numbericality => false
	validates :address_line_1, :presence => true, 
	validates :postcode, :presence => true
	validates :email, :presence => true
	validates :phone, :presence => true
	validates :reg, :presence => true, :numericality => false
	validates :model, :presence => true
	validates :damage_report, :presence => true
	validates :accident_report, :presence => true
end
