class CreatePersonalBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_blogs do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
