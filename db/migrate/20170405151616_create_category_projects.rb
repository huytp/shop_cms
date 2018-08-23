class CreateCategoryProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :category_projects do |t|
      t.string :title
      t.string :slug
      t.references :parent, index: true
      t.timestamps
    end
    add_index :category_projects, :slug, unique: true
  end
end
