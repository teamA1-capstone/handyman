class AddStreetAddressToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :street_address, :string
  end
end
