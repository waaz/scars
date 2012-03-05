class RemoveClassFromCar < ActiveRecord::Migration
  def up
    remove_column :cars, :class

  end

  def down
  end
end
