class AddPasswordDigestToProfessionals < ActiveRecord::Migration[7.0]
  def change
    add_column :professionals, :password_digest, :string
  end
end
