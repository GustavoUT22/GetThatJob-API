class CreateRecruiters < ActiveRecord::Migration[7.0]
  def change
    create_table :recruiters do |t|
      t.string :email
      t.string :company_name
      t.string :company_website
      t.text :company_about
      t.string :password

      t.timestamps
    end
  end
end
