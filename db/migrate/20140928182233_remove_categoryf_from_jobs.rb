class RemoveCategoryfFromJobs < ActiveRecord::Migration
  def change
    rename_column :jobs, :category, :category_name
  end
end
