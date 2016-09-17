module Naturesoft::Products
  class CartItem < ApplicationRecord
    belongs_to :product
    belongs_to :cart
    
    def total_price
      product.new_price*quantity
    end
    
    def self.number_items
      count = 0
      self.all.each do |item|
        count += item.quantity
      end
      
      return count
    end 
    
  end
end
