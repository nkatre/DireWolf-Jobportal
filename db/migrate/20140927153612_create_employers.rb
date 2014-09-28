class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :company_name
      t.string :contact_name
      t.string :email
      t.string :password
      t.integer :admin_id

      t.timestamps
    end
  end
end
