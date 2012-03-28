class AddCarIdToAccident < ActiveRecord::Migration
  def change
    add_column :accidents, :car_id, :integer

  end
end
