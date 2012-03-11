class AddAddressToCustomer < ActiveRecord::Migration
  def change
   add_column :customers, :address_one, :string
   add_column :customers, :address_two, :string
   add_column :customers, :city, :string
   add_column :customers, :postcode, :string
  end
end
