class AddFirstNameToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :first_name, :string
  end
end
