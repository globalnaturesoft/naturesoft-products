module Naturesoft::Products
  class LabelsProduct < ApplicationRecord
    belongs_to :label
    belongs_to :product
  end
end
