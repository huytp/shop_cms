class AddParentIdToCategoryPost < ActiveRecord::Migration[5.0]
  def change
    add_column :category_posts, :parent_id, :integer
  end
end
