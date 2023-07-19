class RemovePasswordFromProfessionalAndRecruiter < ActiveRecord::Migration[7.0]
  def change
    remove_column :professionals, :password, :string
    remove_column :recruiters, :password, :string
  end
end
