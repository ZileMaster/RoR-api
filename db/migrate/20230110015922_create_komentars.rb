class CreateKomentars < ActiveRecord::Migration[7.0]
  def change
    create_table :komentars do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.string :headline
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
