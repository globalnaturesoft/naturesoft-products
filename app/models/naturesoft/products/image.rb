module Naturesoft::Products
  class Image < ApplicationRecord
    belongs_to :product
  end
end
