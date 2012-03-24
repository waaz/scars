class UpdatePayements < ActiveRecord::Migration
  def up
    add_column :payements, :billing_address_line_1, :string
    add_column :payements, :billing_address_line_2, :string
    add_column :payements, :billing_postcode, :string
    add_column :payements, :expires_on, :date
    add_column :payements, :card_type, :string
  end

  def down
  end
end
