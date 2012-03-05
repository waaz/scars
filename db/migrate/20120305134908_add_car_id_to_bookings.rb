class AddCarIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :car_id, :integer

  end
end
