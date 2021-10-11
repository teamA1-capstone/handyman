class AddZipCodeToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :zip_code, :string
  end
end
