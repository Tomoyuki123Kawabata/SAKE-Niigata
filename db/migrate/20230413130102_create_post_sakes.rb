class CreatePostSakes < ActiveRecord::Migration[6.1]
  def change
    create_table :post_sakes do |t|
      t.string :sake, null: false
      t.text :explanation, null: false
      t.string :star, null: false
      t.text :comment, null: false
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.timestamps
    end
  end
end
