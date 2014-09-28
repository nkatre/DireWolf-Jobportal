class RemoveColumnFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :job_id
  end
end
