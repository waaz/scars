class ChangeCarClassName < ActiveRecord::Migration
  def up
	remove_column :car_classes, :class_name
	add_column :car_classes, :name, :string
  end

  def down
    remove_column :car_classes, :name
	add_column :car_classes, :class_name, :string
  end
end
