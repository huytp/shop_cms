class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.string :meta_keyword
      t.string :meta_title
      t.string :meta_description
      t.attachment :image
      t.integer :user_id
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
