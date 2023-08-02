class ChangeSalaryToIntegerArrayInJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :salary
    add_column :jobs, :salary, :integer, array: true, default: []
  end
end
