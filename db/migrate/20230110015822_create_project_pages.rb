class CreateProjectPages < ActiveRecord::Migration[7.0]
  def change
    create_table :project_pages do |t|
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
