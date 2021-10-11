class AddSpecialtyToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :specialty, :string
  end
end
