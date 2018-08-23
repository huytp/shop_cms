class AddFeatureToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :feature, :boolean, default: false
    add_column :products, :lasted, :boolean, default: false
  end
end
