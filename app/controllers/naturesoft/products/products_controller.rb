module Naturesoft
  module Products
    class ProductsController < Naturesoft::FrontendController
      def detail
        @body_class = "product-page"
        @product = Naturesoft::Products::Product.find(params[:id])
      end
      def quick_view
        @product = Naturesoft::Products::Product.find(params[:product_id])
        render :layout => false
      end
    end
  end
end