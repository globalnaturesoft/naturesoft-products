module Naturesoft
  module Products
    class CartsController < Naturesoft::FrontendController
      before_action :set_cart, only: [:show, :edit, :update, :destroy]
      rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
      
      # GET /carts
      # GET /carts.json
      def index
        @body_class = "category-page"
        @cart.remove_cart_item(params[:cart_item_id]) if params[:do] == "remove_cart_item"
      end
    
      # POST /carts
      # POST /carts.json
      def create
        @cart = Naturesoft::Products::Cart.new(cart_params)
        if @cart.save
          redirect_to naturesoft_products.carts_path
        end
      end
    
      # PATCH/PUT /carts/1
      # PATCH/PUT /carts/1.json
      def update
        params.to_unsafe_h[:quantities].each do |q|
          li = Naturesoft::Products::CartItem.find(q[0])
          li.update_attribute(:quantity, q[1])
        end
        
        redirect_to naturesoft_products.carts_path
      end
    
      # DELETE /carts/1
      # DELETE /carts/1.json
      def destroy
        @cart.destroy
        redirect_to naturesoft_products.carts_path
      end
      
      def login
      end
      
      def customer_info
      end
      
      def delivery_info
      end
      
      def confirm
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_cart
          @cart = Naturesoft::Products::Cart.find(params[:id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def cart_params
          params.fetch(:cart, {})
        end
        
        def invalid_cart
          logger.error "Attempt to access invalid cart #{params[:id]}"
          redirect_to root_path, notice: 'Invalid cart'
        end
    end
  end
end