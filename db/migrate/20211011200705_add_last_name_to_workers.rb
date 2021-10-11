class AddLastNameToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :last_name, :string
  end
end
