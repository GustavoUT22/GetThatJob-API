class ChangeDataTypeOfPhoneInProfessionals < ActiveRecord::Migration[7.0]
  def change
    change_column :professionals, :phone, :bigint
  end
end
