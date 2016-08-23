class CreateNaturesoftProductsProductProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_product_properties do |t|
      t.string :value
      t.decimal :price
      t.references :product, index: true, references: :naturesoft_products_products
      t.references :property, index: true, references: :naturesoft_products_properties

      t.timestamps
    end
  end
end
