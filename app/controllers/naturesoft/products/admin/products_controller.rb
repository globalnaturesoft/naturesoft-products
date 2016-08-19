module Naturesoft
  module Products
    module Admin
      class ProductsController < Naturesoft::Admin::AdminController
        before_action :set_product, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Product", naturesoft_products.admin_products_path
          add_breadcrumb "Products", naturesoft_products.admin_products_path
        end
    
        # GET /products
        def index
          @products = Product.search(params).paginate(:page => params[:page], :per_page => Naturesoft::Option.get("products", "items_per_page"))
        end
    
        # GET /products/1
        def show
        end
    
        # GET /products/new
        def new
          @product = Product.new
          add_breadcrumb "New Product", nil,  class: "active"
        end
    
        # GET /products/1/edit
        def edit
          add_breadcrumb "Edit Product", nil,  class: "active"
        end
    
        # POST /products
        def create
          @product = Product.new(product_params)
          @product.user = current_user
          @product.categories.clear
          @product.labels.clear
          
          if params[:category_ids].present?
            params[:category_ids].each do |id|      
              @product.categories << Category.find(id)
            end
          end
          
          if params[:label_ids].present?
            params[:label_ids].each do |id|      
              @product.labels << Label.find(id)
            end
          end
    
          if @product.save
            redirect_to naturesoft_products.edit_admin_product_path(@product.id), notice: 'Product was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /products/1
        def update
          @product.categories.clear
          @product.labels.clear
          
          if params[:category_ids].present?
            params[:category_ids].each do |id|      
              @product.categories << Category.find(id)
            end
          end
          
          if params[:label_ids].present?
            params[:label_ids].each do |id|      
              @product.labels << Label.find(id)
            end
          end
          
          if @product.update(product_params)
            redirect_to naturesoft_products.edit_admin_product_path(@product.id), notice: 'Product was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /products/1
        def destroy
          @product.destroy
          render text: 'Product was successfully destroyed.'
        end
        
        #CHANGE STATUS /products
        def enable
          @product.enable
          render text: 'Product was successfully active.'
        end
        
        def disable
          @product.disable
          render text: 'Product was successfully inactive.'
        end
        
        # DELETE /products/delete?ids=1,2,3
        def delete
          @products = Product.where(id: params[:ids].split(","))
          @products.destroy_all
          render text: 'Product(s) was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_product
            @product = Product.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def product_params
            params.fetch(:product, {}).permit(:name,
                                              :code,
                                              :new_price,
                                              :quantity,
                                              :unit,
                                              :discount,
                                              :old_price,
                                              :manufacturer_id,
                                              :short_description,
                                              :description,
                                              images_attributes: [:id, :title, :image_url, :is_main, :_destroy])
          end
      end
    end
  end
end
