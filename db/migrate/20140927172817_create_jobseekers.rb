class CreateJobseekers < ActiveRecord::Migration
  def change
    create_table :jobseekers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :phone
      t.string :skills
      t.text :resume

      t.timestamps
    end
  end
end
