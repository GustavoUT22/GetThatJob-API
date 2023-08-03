class AddJobStatusToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :job_status, :boolean, default: true
  end
end
