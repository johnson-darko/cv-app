class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :level
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
