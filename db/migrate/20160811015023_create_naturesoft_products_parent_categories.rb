class CreateNaturesoftProductsParentCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_parent_categories do |t|
      t.integer :parent_id
      t.references :category, index: true, references: :naturesoft_products_categories

      t.timestamps
    end
  end
end
