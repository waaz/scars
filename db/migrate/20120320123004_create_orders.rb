class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :payement_id
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_expires_on
      t.string :card_type
      t.string :billing_address_line_1
      t.string :billing_address_line_2
      t.string :billing_postcode

      t.timestamps
    end
  end
end
