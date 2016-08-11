class CreateNaturesoftProductsImages < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_images do |t|
      t.string :image_url
      t.boolean :is_main, default: false
      t.references :product, index: true, references: :naturesoft_products_products

      t.timestamps
    end
  end
end
