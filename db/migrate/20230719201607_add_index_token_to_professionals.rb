class AddIndexTokenToProfessionals < ActiveRecord::Migration[7.0]
  def change
    add_index :professionals, :token, unique: true
  end
end
