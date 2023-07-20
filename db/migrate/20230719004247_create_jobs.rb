class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :category
      t.string :type
      t.integer :salary
      t.text :mandatory
      t.text :optional
      t.text :about
      t.integer :applications_count, default: 0
      t.references :recruiter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
