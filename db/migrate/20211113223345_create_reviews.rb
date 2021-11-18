class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :headline
      t.text :body
      t.integer :skill_rating
      t.integer :honesty_rating
      t.integer :reliability_rating
      t.integer :focused_rating

      t.timestamps
    end
  end
end
