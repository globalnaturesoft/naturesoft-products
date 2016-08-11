class CreateNaturesoftProductsCategoriesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_categories_products do |t|
      t.references :category, index: true, references: :naturesoft_products_categories
      t.references :product, index: true, references: :naturesoft_products_products

      t.timestamps
    end
  end
end
