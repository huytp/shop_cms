class CreateFacebookAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :facebook_admins do |t|
      t.string :admin_id

      t.timestamps
    end
  end
end
