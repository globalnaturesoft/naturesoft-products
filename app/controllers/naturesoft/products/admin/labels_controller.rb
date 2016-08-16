module Naturesoft
  module Products
    module Admin
      class LabelsController < Naturesoft::Admin::AdminController
        before_action :set_label, only: [:show, :edit, :update, :enable, :disable, :destroy]
        before_action :default_breadcrumb
        
        # add top breadcrumb
        def default_breadcrumb
          add_breadcrumb "Product", naturesoft_products.admin_labels_path
          add_breadcrumb "Labels", naturesoft_products.admin_labels_path
        end
        
        # GET /labels
        def index
          @labels = Label.search(params).paginate(:page => params[:page], :per_page => 10)
        end
    
        # GET /labels/1
        def show
        end
    
        # GET /labels/new
        def new
          @label = Label.new
          add_breadcrumb "New Label", nil,  class: "active"
        end
    
        # GET /labels/1/edit
        def edit
          add_breadcrumb "Edit Label", nil,  class: "active"
        end
    
        # POST /labels
        def create
          @label = Label.new(label_params)
          @label.user = current_user
    
          if @label.save
            redirect_to naturesoft_products.edit_admin_label_path(@label.id), notice: 'Label was successfully created.'
          else
            render :new
          end
        end
    
        # PATCH/PUT /labels/1
        def update
          if @label.update(label_params)
            redirect_to naturesoft_products.edit_admin_label_path(@label.id), notice: 'Label was successfully updated.'
          else
            render :edit
          end
        end
    
        # DELETE /labels/1
        def destroy
          @label.destroy
          render text: ' Label was successfully destroyed.'
        end
        
        #CHANGE STATUS /labels
        def enable
          @label.enable
          render text: 'Label was successfully active.'
        end
        
        def disable
          @label.disable
          render text: 'Label was successfully inactive.'
        end
        
        # DELETE /labels/delete?ids=1,2,3
        def delete
          @labels = Label.where(id: params[:ids].split(","))
          @labels.destroy_all
          render text: 'Label(s) was successfully destroyed.'
        end
    
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_label
            @label = Label.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def label_params
            params.fetch(:label, {}).permit(:name, :description, :status)
          end
      end
    end
  end
end
