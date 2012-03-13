class ReworkCars < ActiveRecord::Migration
  def up
   remove_column :cars, :repair
   add_column :cars, :status, :string
  end

  def down
   remove_column :cars, :status
   add_column :cars, :repair, :string
  end
end
