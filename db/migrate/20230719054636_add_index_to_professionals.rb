class AddIndexToProfessionals < ActiveRecord::Migration[7.0]
  def change
    add_index :professionals, :email
  end
end
