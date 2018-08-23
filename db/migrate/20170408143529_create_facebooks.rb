class CreateFacebooks < ActiveRecord::Migration[5.0]
  def change
    create_table :facebooks do |t|
      t.string :app_id
      t.boolean :comment_active, default: true
      t.boolean :like_active, default: true

      t.timestamps
    end
  end
end
