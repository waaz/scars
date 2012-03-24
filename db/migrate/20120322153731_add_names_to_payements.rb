class AddNamesToPayements < ActiveRecord::Migration
  def change
    add_column :payements, :first_name, :string

    add_column :payements, :last_name, :string

  end
end
