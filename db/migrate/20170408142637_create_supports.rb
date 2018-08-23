class CreateSupports < ActiveRecord::Migration[5.0]
  def change
    create_table :supports do |t|
      t.string :name
      t.string :phone
      t.string :skype

      t.timestamps
    end
  end
end
