class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.references :professional, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.text :experience
      t.text :why_interested

      t.timestamps
    end
  end
end
