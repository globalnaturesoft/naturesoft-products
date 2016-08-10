class CreateNaturesoftProductsManufacturers < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_manufacturers do |t|
      t.string :image_url
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.text :description
      t.string :status, default: "active"
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
