class ReworkBookings < ActiveRecord::Migration
  def up
   remove_column :bookings, :booking_address
   remove_column :bookings, :booking_postcode
   add_column :bookings, :address_one, :string
   add_column :bookings, :address_two, :string
   add_column :bookings, :city, :string
   add_column :bookings, :postcode, :string
  end

  def down
   remove_column :bookings, :address_one, :string
   remove_column :bookings, :address_two, :string
   remove_column :bookings, :city, :string
   remove_column :bookings, :postcode, :string
   add_column :bookings, :booking_address
   add_column :bookings, :booking_postcode
  end
end
