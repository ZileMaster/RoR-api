class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :personal_blog, null: false, foreign_key: true
      t.references :travel_blog, null: false, foreign_key: true
      t.references :project_page, null: false, foreign_key: true
      t.string :headline
      t.string :topic
      t.string :description
      t.integer :likes

      t.timestamps
    end
  end
end
