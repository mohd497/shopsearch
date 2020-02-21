class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :salary_range
      t.string :email

      t.timestamps
    end
  end
end
