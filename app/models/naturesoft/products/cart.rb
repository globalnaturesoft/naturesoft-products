module Naturesoft::Products
  class Cart < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    
    # add product - smarter cart
    def add_product(product_id)
      current_item = cart_items.find_by(product_id: product_id)
      if current_item
        current_item.quantity += 1
      else
        current_item = cart_items.build(product_id: product_id)
      end
        current_item
    end
    
    # remove cart item
    def remove_cart_item(cart_item_id)
      self.cart_items.where(id: cart_item_id).destroy_all
    end
    
    # total price - all cart items
    def total_order
      amount = 0.0
      self.cart_items.each do |od|
        amount += od.total_price
      end
      
      return amount
    end
    
  end
end
