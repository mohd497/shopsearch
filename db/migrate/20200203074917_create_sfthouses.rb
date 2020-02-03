class CreateSfthouses < ActiveRecord::Migration[5.2]
  def change
    create_table :sfthouses do |t|
      t.string :title
      t.string :website
      t.string :contact

      t.timestamps
    end
  end
end
