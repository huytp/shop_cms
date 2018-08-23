class CreateCategoryPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :category_posts do |t|
      t.string :name
      t.string :slug, unique: true

      t.timestamps
    end
    add_index :category_posts, :slug, unique: true
  end
end
