class CreateNaturesoftProductsProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_products do |t|
      t.string :name
      t.string :code
      t.decimal :new_price
      t.decimal :old_price
      t.integer :discount
      t.decimal :quantity
      t.string :unit
      t.string :tags
      t.string :status, default: "active"
      t.boolean :is_show, default: false
      t.text :short_description
      t.text :description
      t.references :manufacturer, index: true, references: :naturesoft_products_manufacturers
      t.references :image, index: true, references: :naturesoft_products_images
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
