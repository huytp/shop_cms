class CreatTablePostCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :post_categories do |t|
      t.belongs_to :post, index: true
      t.belongs_to :category_post, index: true
      t.timestamps
    end
  end
end
