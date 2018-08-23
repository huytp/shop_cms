class AddMetaToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :meta_title, :string
    add_column :projects, :meta_keyword, :string
    add_column :projects, :meta_description, :string
  end
end
