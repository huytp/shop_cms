class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.attachment :image
      t.integer :user_id
      t.boolean :active, default: true
      t.string :slug, unique: true
      t.string :meta_title
      t.string :meta_keyword
      t.string :meta_description
      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
