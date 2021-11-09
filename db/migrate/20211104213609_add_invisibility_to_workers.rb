class AddInvisibilityToWorkers < ActiveRecord::Migration[6.1]
  def change
    add_column :workers, :invisibility, :integer
  end
end
