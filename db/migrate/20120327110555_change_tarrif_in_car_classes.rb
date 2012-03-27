class ChangeTarrifInCarClasses < ActiveRecord::Migration
  def up
    change_column :car_classes, :tarrif, :decimal, :precision => 10, :scale => 2
  end

  def down
  end
end
