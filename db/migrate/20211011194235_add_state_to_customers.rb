class AddStateToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :state, :string
  end
end
