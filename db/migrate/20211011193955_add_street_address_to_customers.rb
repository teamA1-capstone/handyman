class AddStreetAddressToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :street_address, :string
  end
end
