class AddIndexTokenToRecruiters < ActiveRecord::Migration[7.0]
  def change
    add_index :recruiters, :token, unique: true
  end
end
