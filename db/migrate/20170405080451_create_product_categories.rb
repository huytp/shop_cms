class CreateProductCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :product_categories do |t|
      t.belongs_to :category, index: true
      t.belongs_to :product, index: true
      t.timestamps
    end
  end
end
