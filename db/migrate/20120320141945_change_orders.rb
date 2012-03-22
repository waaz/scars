class ChangeOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :card_expires_on
    add_column :orders, :card_expires_on, :date
  end

  def down
  end
end
