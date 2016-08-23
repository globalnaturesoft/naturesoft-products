class CreateNaturesoftProductsProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_properties do |t|
      t.string :name
      t.text :description
      t.string :status, default: "active"
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
