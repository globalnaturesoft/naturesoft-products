class CreateNaturesoftProductsCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_cart_items do |t|
      t.integer :quantity, default: 1
      t.references :product, index: true, references: :naturesoft_products_products
      t.belongs_to :cart, index: true, belongs_to: :naturesoft_products_carts

      t.timestamps
    end
  end
end
