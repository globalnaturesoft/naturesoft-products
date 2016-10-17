module Naturesoft
  module Products
    class CategoriesController < Naturesoft::FrontendController
      before_action :get_category, only: [:list]
      
      def list
        @body_class = "category-page"
        @page_title = @category.name
        
        # Manufaturer
        if params[:manufacturer_id].present?
          @page_title += " " + Manufacturer.find(params[:manufacturer_id]).name
        end
        
        @products = @category.get_products(params)
      end
      
      private
      def get_category
        @category = Naturesoft::Products::Category.find(params[:id])
      end
      
    end
  end
end