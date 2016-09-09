module Naturesoft
  module Products
    class CategoriesController < Naturesoft::FrontendController
      before_action :get_category, only: [:list]
      
      def list
        @body_class = "category-page"
      end
      
      private
      def get_category
        @category = Naturesoft::Products::Category.find(params[:id])
      end
      
    end
  end
end