class CreateProfessionals < ActiveRecord::Migration[7.0]
  def change
    create_table :professionals do |t|
      t.string :email
      t.string :name
      t.date :birth_date
      t.string :linkedin
      t.integer :phone
      t.string :password
      t.string :professional_title
      t.text :experience
      t.text :education

      t.timestamps
    end
  end
end
