class AddIpAddressToPayements < ActiveRecord::Migration
  def change
    add_column :payements, :ip_address, :string
    add_column :payements, :billing_city, :string

  end
end
