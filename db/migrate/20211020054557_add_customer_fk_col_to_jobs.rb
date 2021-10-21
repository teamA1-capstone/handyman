class AddCustomerFkColToJobs < ActiveRecord::Migration[6.1]
  def change
    add_reference :jobs, :customer, foreign_key: true
  end
end
