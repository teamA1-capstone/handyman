class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :specialty
      t.boolean :completed
      t.boolean :in_progress
      t.string :description

      t.timestamps
    end
  end
end
