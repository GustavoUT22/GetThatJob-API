class AddTokenToRecruiter < ActiveRecord::Migration[7.0]
  def change
    add_column :recruiters, :token, :string
  end
end
