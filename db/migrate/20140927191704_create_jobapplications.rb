class CreateJobapplications < ActiveRecord::Migration
  def change
    create_table :jobapplications do |t|
      t.integer :job_id
      t.integer :jobseeker_id
      t.text :coverletter
      t.string :status

      t.timestamps
    end
  end
end
