class AddFieldsToCarClass < ActiveRecord::Migration
  def change
    add_column :car_classes, :description, :text

    add_column :car_classes, :image_url, :string

    add_column :car_classes, :tarrif, :decimal
  end
end
