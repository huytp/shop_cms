class CreateProjectCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :project_categories do |t|
      t.belongs_to :category_project, index: true
      t.belongs_to :project, index: true
      t.timestamps
    end
  end
end
