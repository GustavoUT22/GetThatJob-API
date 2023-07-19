class AddIndexToRecruiters < ActiveRecord::Migration[7.0]
  def change
    add_index :recruiters, :email
    add_index :recruiters, :company_name
  end
end
