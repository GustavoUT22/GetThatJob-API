class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.boolean :following

      t.timestamps
    end
  end
end
