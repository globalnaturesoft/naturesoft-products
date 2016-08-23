module Naturesoft::Products
  class ProductsProperty < ApplicationRecord
    belongs_to :product
    belongs_to :property
  end
end
