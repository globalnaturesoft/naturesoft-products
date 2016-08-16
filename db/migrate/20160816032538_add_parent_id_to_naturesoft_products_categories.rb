class AddParentIdToNaturesoftProductsCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_products_categories, :parent_id, :integer
  end
end
