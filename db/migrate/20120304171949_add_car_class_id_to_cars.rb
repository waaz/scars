class AddCarClassIdToCars < ActiveRecord::Migration
  def change
    add_column :cars, :car_class_id, :integer

  end
end
