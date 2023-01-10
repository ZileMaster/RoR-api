class CreateInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :infos do |t|
      t.references :notice_board, null: false, foreign_key: true
      t.string :head
      t.string :description

      t.timestamps
    end
  end
end
