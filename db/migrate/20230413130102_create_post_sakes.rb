class CreatePostSakes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_sakes do |t|
      t.string :sake, null: false
      t.text :explanation
      t.string :star
      t.text :comment, null: false
      t.integer :user_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
