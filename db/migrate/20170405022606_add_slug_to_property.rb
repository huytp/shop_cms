class AddSlugToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :slug, :string
  end
end
