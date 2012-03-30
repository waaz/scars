class User < ActiveRecord::Base
 has_many :bookings, :dependent => :destroy #has many relationship, if user destroyed booking is also
 has_one :customer, :dependent => :destroy # has many relationship, if customer destroyed booking destroyed

 has_secure_password #password secure
 attr_accessible :email, :password, :password_confirmation, :customer_attributes #create attributes for user submission form
 attr_readonly :email #email is read only attribute

 #####Use for testing only#####
 attr_protected :is_admin
 ##############################

 validates :email, uniqueness: true, presence: true #validates: email is present and unique
 accepts_nested_attributes_for :customer
 
 def is_customer
  if customer
   if customer.first_name
    true
   else
    false
   end
  end		
 end
end
