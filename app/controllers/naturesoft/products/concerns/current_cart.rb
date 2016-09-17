module Naturesoft
  module Products
    extend ActiveSupport::Concern
    
    private
      def set_cart
        @cart = Naturesoft::Products::Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        @cart = Naturesoft::Products::Cart.create
        session[:cart_id] = @cart.id
      end
  end
end