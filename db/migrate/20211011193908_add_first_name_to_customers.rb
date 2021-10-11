class AddFirstNameToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :first_name, :string
  end
end
