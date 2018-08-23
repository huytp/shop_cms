class ChangeTitleToNameFromCategoryPost < ActiveRecord::Migration[5.0]
  def change
    rename_column :category_posts, :name, :title
  end
end
