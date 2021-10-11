class AddZipCodeToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :zip_code, :string
  end
end
