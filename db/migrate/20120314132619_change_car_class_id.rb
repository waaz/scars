class ChangeCarClassId < ActiveRecord::Migration
  def up
    add_column :bookings, :car_id, :integer
    remove_column :bookings, :car_class_id
  end

  def down
  end
end
