class CreateNaturesoftProductsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_categories do |t|
      t.string :name
      t.text :description
      t.integer :level
      t.string :status, default: "active"
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
