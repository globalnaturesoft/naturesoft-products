module Naturesoft
  module Products
    class ProductsController < Naturesoft::FrontendController
      def detail
        @body_class = "product-page"
      end
    end
  end
end