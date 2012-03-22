class Payement < ActiveRecord::Base

  belongs_to :booking
  accepts_nested_attributes_for :booking

end
