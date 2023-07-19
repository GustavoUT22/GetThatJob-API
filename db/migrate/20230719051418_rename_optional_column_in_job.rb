class RenameOptionalColumnInJob < ActiveRecord::Migration[7.0]
  def change
    rename_column :jobs, :optional, :optional_req
  end
end
