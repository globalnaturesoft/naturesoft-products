module Naturesoft
  module Products
    module Backend
      class ManufacturersController < Naturesoft::Backend::BackendController
        before_action :set_manufacturer, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Product", naturesoft_products.backend_manufacturers_path
          add_breadcrumb "Manufacturers", naturesoft_products.backend_manufacturers_path
        end
        
        # GET /manufacturers
        def index
          @manufacturers = Manufacturer.search(params).paginate(:page => params[:page], :per_page => Naturesoft::Option.get("products", "manufacturers_items_per_page"))
        end
    
        # GET /manufacturers/1
        def show
        end
    
        # GET /manufacturers/new
        def new
          @manufacturer = Manufacturer.new
          add_breadcrumb "New Manufacturer", nil,  class: "active"
        end
    
        # GET /manufacturers/1/edit
        def edit
          add_breadcrumb "Edit Manufacturer", nil,  class: "active"
        end
    
        # POST /manufacturers
        def create
          @manufacturer = Manufacturer.new(manufacturer_params)
          @manufacturer.user = current_user
    
          if @manufacturer.save
            redirect_to naturesoft_products.edit_backend_manufacturer_path(@manufacturer.id), notice: 'Manufacturer was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /manufacturers/1
        def update
          if @manufacturer.update(manufacturer_params)
            redirect_to naturesoft_products.edit_backend_manufacturer_path(@manufacturer.id), notice: 'Manufacturer was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /manufacturers/1
        def destroy
          @manufacturer.destroy
          render text: ' Manufacturer was successfully destroyed.'
        end
        
        #CHANGE STATUS /manufacturers
        def enable
          @manufacturer.enable
          render text: 'Manufacturer was successfully active.'
        end
        
        def disable
          @manufacturer.disable
          render text: 'Manufacturer was successfully inactive.'
        end
        
        # DELETE /manufacturers/delete?ids=1,2,3
        def delete
          @manufacturers = Manufacturer.where(id: params[:ids].split(","))
          @manufacturers.destroy_all
          render text: 'Manufacturer(s) was successfully destroyed.'
        end
        
        # GET /manufacturers/select2
        def select2
          render json: Manufacturer.select2(params)
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_manufacturer
            @manufacturer = Manufacturer.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def manufacturer_params
            params.fetch(:manufacturer, {}).permit(:image_url, :name, :phone, :email, :address, :description, :status)
          end
      end
    end
  end
end
