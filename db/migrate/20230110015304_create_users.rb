class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :username
      t.string :password
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
