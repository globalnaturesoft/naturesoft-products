module Naturesoft
  module Products
    class CartItemsController < Naturesoft::FrontendController
      before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
    
      # POST /cart_items
      # POST /cart_items.json
      def create
        product = Product.find(params[:product_id])
        @cart_item = @cart.add_product(product.id)
    
        if @cart_item.save
          redirect_to naturesoft_products.carts_path
        end
      end
      
      # POST /cart_items
      # POST /cart_items.json
      def add_to_cart
        product = Product.find(params[:product_id])
        @cart_item = @cart.add_product(product.id)
    
        if @cart_item.save
          redirect_to naturesoft_products.carts_path
        end
      end
    
      # PATCH/PUT /cart_items/1
      # PATCH/PUT /cart_items/1.json
      def update
        if @cart_item.update(cart_item_params)
          redirect_to naturesoft_products.carts_path
        end
      end
    
      # DELETE /cart_items/1
      # DELETE /cart_items/1.json
      def destroy
        @cart_item.destroy
        redirect_to naturesoft_products.carts_path
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_cart_item
          @cart_item = CartItem.find(params[:id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def cart_item_params
          params.require(:cart_item).permit(:product_id)
        end
    end
  end
end