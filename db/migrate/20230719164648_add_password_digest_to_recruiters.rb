class AddPasswordDigestToRecruiters < ActiveRecord::Migration[7.0]
  def change
    add_column :recruiters, :password_digest, :string
  end
end
