class Payement < ActiveRecord::Base

  belongs_to :booking
  has_one :order
  accepts_nested_attributes_for :booking



end
