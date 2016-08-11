module Naturesoft
  module Products
    module Admin
      class CategoriesController < Naturesoft::Admin::AdminController
        before_action :set_category, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Product", naturesoft_products.admin_categories_path
          add_breadcrumb "Categories", naturesoft_products.admin_categories_path
        end
    
        # GET /categories
        def index
          @categories = Category.search(params).paginate(:page => params[:page], :per_page => 100)
        end
    
        # GET /categories/1
        def show
        end
    
        # GET /categories/new
        def new
          @category = Category.new
          add_breadcrumb "New Category", nil,  class: "active"
        end
    
        # GET /categories/1/edit
        def edit
          add_breadcrumb "Edit Category", nil,  class: "active"
        end
    
        # POST /categories
        def create
          @category = Category.new(category_params)
          @category.user = current_user
          
          if @category.save
            # update parent
            @category.parent.clear
            @category.parent << Category.find(params[:parent_id]) if params[:parent_id].present?
            
            redirect_to naturesoft_products.edit_admin_category_path(@category.id), notice: 'Category was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /categories/1
        def update
          if @category.update(category_params)
            # update parent
            @category.parent.clear
            @category.parent << Category.find(params[:parent_id]) if params[:parent_id].present?
            
            redirect_to naturesoft_products.edit_admin_category_path(@category.id), notice: 'Category was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /categories/1
        def destroy
          @category.destroy
          render text: ' Category was successfully destroyed.'
        end
        
        #CHANGE STATUS /categories
        def enable
          @category.enable
          render text: 'Category was successfully active.'
        end
        
        def disable
          @category.disable
          render text: 'Category was successfully inactive.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_category
            @category = Category.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def category_params
            params.fetch(:category, {}).permit(:name, :level, :description)
          end
      end
    end
  end
end
