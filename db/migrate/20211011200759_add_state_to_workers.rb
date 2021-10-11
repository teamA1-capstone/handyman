class AddStateToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :state, :string
  end
end
