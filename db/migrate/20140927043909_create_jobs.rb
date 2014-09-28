class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_id
      t.string :title
      t.text :description
      t.string :tag1
      t.string :tag2
      t.string :tag3
      t.string :category
      t.date :deadline
      t.integer :employer_id

      t.timestamps
    end
  end
end
