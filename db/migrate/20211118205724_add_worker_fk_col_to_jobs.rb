class AddWorkerFkColToJobs < ActiveRecord::Migration[6.1]
  def change
    add_reference :jobs, :worker, foreign_key: true
  end
end
