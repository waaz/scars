class RemoveCarClassFromBookings < ActiveRecord::Migration
  def up
    remove_column :bookings, :car_class
      end

  def down
    add_column :bookings, :car_class, :string
  end
end
