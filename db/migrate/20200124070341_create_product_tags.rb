class CreateProductTags < ActiveRecord::Migration[5.2]
  def change
    create_table :product_tags do |t|
      t.belongs_to :tag
      t.belongs_to :product
      t.timestamps
    end
  end
end
