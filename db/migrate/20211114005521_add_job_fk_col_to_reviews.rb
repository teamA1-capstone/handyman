class AddJobFkColToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :job, foreign_key: true
  end
end
