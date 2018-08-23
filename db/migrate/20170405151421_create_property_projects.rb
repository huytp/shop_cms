class CreatePropertyProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :property_projects do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :property_projects, :name, unique: true
  end
end
