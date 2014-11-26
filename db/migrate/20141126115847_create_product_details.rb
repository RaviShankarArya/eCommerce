class CreateProductDetails < ActiveRecord::Migration
  def change
    create_table :product_details do |t|
      t.string :item_code
      t.string :color
      t.float :price
      t.integer :stock
      t.references :product_type, index: true

      t.timestamps
    end
  end
end
