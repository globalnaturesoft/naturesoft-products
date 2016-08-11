module Naturesoft::Products
  class ParentCategory < ApplicationRecord
    belongs_to :category
    belongs_to :parent, class_name: "Category"
  end
end
