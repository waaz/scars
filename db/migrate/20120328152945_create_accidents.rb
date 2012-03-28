class CreateAccidents < ActiveRecord::Migration
  def change
    create_table :accidents do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line_1
      t.string :address_line_2
      t.string :postcode
      t.string :email
      t.string :phone
      t.string :reg
      t.string :model
      t.string :damage_report
      t.string :accident_report

      t.timestamps
    end
  end
end
