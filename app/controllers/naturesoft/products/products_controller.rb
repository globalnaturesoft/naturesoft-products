module Naturesoft
  module Products
    class ProductsController < Naturesoft::FrontendController
      def detail
        @body_class = "product-page"
        @product = Naturesoft::Products::Product.get_all_products.find(params[:id])
        @newest_products = Naturesoft::Products::Product.get_newest_products(params)
        @on_sales_products = Naturesoft::Products::Product.get_on_sales_products(params)
      end
      def quick_view
        @product = Naturesoft::Products::Product.find(params[:product_id])
        render :layout => false
      end
    end
  end
end