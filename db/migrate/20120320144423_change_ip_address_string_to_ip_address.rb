class ChangeIpAddressStringToIpAddress < ActiveRecord::Migration
  def up
    remove_column :orders, :ip_address_string
    add_column :orders, :ip_address, :string
  end

  def down
  end
end
