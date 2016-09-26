Naturesoft::ApplicationController.class_eval do
  before_action :get_cart
      
      private
        def get_cart
          @cart = Naturesoft::Products::Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
          @cart = Naturesoft::Products::Cart.create
          session[:cart_id] = @cart.id
        end
end
