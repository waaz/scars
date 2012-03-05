class RemoveBookingIdFromCars < ActiveRecord::Migration
  def up
    remove_column :cars, :booking_id
      end

  def down
    add_column :cars, :booking_id, :integer
  end
end
