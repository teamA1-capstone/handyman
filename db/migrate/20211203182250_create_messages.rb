class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.references :sender, polymorphic: true
      t.references :receiver, polymorphic: true

      t.timestamps
    end
  end
end
