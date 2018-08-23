class AddFeatureToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :feature, :boolean, default: false
  end
end
