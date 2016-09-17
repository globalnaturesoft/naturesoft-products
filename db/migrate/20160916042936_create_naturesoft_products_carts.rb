class CreateNaturesoftProductsCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_products_carts do |t|

      t.timestamps
    end
  end
end
