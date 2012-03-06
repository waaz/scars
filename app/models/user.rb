class User < ActiveRecord::Base
 has_many :bookings, :dependent => :destroy
 has_one :customer, :dependent => :destroy

 has_secure_password
 attr_accessible :email, :password, :password_confirmation, :id
 attr_readonly :email

 #####Use for testing only#####
 attr_accessible :is_admin
 ##############################

 validates :email, uniqueness: true, presence: true
 
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
