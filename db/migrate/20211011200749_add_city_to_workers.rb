class AddCityToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :city, :string
  end
end
