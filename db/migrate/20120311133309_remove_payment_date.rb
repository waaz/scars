class RemovePaymentDate < ActiveRecord::Migration
  def up
   remove_column :payements, :payement_date
  end

  def down
   add_column :payements, :payement_date
  end
end
