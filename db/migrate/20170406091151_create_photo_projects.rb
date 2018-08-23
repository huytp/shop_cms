class CreatePhotoProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_projects do |t|
      t.attachment :image
      t.references :project, index: true
      t.timestamps
    end
  end
end
