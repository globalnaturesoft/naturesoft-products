module Naturesoft
  module Products
    class ProductsController < Naturesoft::FrontendController
      def detail
        @body_class = "product-page"
        @product = Naturesoft::Products::Product.find(params[:id])
      end
    end
  end
end