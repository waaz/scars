class RemoveClassFromCars < ActiveRecord::Migration
  def up
    remove_column :cars, :class
      end

  def down
    add_column :cars, :class, :string
  end
end
