class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
