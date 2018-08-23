class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.string :meta_title
      t.string :meta_keyword
      t.string :meta_description
      t.column :old_price, "BIGINT"
      t.column :new_price, "BIGINT"
      t.string :sku
      t.attachment :image
      t.string :property

      t.timestamps
    end
  end
end
