class CreateNaturesoftProductsProductsProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_products_properties do |t|
      t.references :product, index: true, references: :naturesoft_products_products
      t.references :property, index: true, references: :naturesoft_products_properties

      t.timestamps
    end
  end
end
