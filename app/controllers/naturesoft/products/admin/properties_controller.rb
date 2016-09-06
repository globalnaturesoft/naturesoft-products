module Naturesoft
  module Products
    module Admin
      class PropertiesController < Naturesoft::Admin::AdminController
        before_action :set_property, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Product", naturesoft_products.admin_properties_path
          add_breadcrumb "Properties", naturesoft_products.admin_properties_path
        end
    
        # GET /properties
        def index
          @properties = Property.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /properties/1
        def show
        end
    
        # GET /properties/new
        def new
          @property = Property.new
          add_breadcrumb "New Property", nil,  class: "active"
        end
    
        # GET /properties/1/edit
        def edit
          add_breadcrumb "Edit Property", nil,  class: "active"
        end
    
        # POST /properties
        def create
          @property = Property.new(property_params)
          @property.user = current_user
    
          if @property.save
            redirect_to naturesoft_products.edit_admin_property_path(@property.id), notice: 'Property was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /properties/1
        def update
          if @property.update(property_params)
            redirect_to naturesoft_products.edit_admin_property_path(@property.id), notice: 'Property was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /properties/1
        def destroy
          @property.destroy
          render text: 'Property was successfully destroyed.'
        end
        
         #CHANGE STATUS /properties
        def enable
          @property.enable
          render text: 'Property was successfully active.'
        end
        
        def disable
          @property.disable
          render text: 'Property was successfully inactive.'
        end
        
        # DELETE /properties/delete?ids=1,2,3
        def delete
          @properties = Property.where(id: params[:ids].split(","))
          @properties.destroy_all
          render text: 'Property(s) was successfully destroyed.'
        end
        
        # GET /categories/select2
        def select2
          render json: Property.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_property
            @property = Property.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def property_params
            params.fetch(:property, {}).permit(:name, :description, :status)
          end
      end
    end
  end
end