class ChangeCarClassNameAgain < ActiveRecord::Migration
  def up
	remove_column :car_classes, :name
	add_column :car_classes, :car_class_name, :string
  end

  def down
    remove_column :car_classes, :car_class_name
	add_column :car_classes, :name, :string
  end
end
