class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.string :date_from
      t.string :date_to
      t.string :level
      t.text :descrption
      t.string :place
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
