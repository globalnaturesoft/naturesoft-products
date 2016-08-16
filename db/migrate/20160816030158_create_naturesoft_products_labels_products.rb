class CreateNaturesoftProductsLabelsProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_labels_products do |t|
      t.references :label, index: true, references: :naturesoft_products_labels
      t.references :product, index: true, references: :naturesoft_products_products
      
      t.timestamps
    end
  end
end
