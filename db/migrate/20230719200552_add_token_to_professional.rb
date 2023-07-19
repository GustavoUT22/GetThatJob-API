class AddTokenToProfessional < ActiveRecord::Migration[7.0]
  def change
    add_column :professionals, :token, :string
  end
end
