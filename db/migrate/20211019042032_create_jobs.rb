class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
