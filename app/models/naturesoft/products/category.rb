module Naturesoft::Products
  class Category < ApplicationRecord
    belongs_to :user
  end
end
