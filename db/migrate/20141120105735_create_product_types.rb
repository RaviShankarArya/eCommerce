class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.string :product_type_name
      t.references :product_category, index: true

      t.timestamps
    end
  end
end
