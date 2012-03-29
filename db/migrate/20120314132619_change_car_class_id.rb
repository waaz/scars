class ChangeCarClassId < ActiveRecord::Migration
  def up
    
    remove_column :bookings, :car_class_id
  end

  def down
  end
end
