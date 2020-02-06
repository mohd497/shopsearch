class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.float :rating
      t.references :sfthouse, foreign_key: true

      t.timestamps
    end
  end
end
