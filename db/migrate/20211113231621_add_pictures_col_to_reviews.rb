class AddPicturesColToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :pictures, :json
  end
end
