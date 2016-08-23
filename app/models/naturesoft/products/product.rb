module Naturesoft::Products
  class Product < ApplicationRecord		
		validates :name, :code, :new_price, :quantity, :unit, presence: true
    belongs_to :manufacturer
    belongs_to :user
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :labels
    has_and_belongs_to_many :properties
    has_many :images, dependent: :destroy, :inverse_of => :product
    accepts_nested_attributes_for :images,
				:reject_if => lambda { |a| a[:image_url].blank? && a[:id].blank? },
				:allow_destroy => true
		has_many :product_properties, dependent: :destroy, :inverse_of => :product
		accepts_nested_attributes_for :product_properties,
				:reject_if => lambda { |a| a[:value].blank? && a[:price].blank? && a[:property_id].blank? },
				:allow_destroy => true
    
    def self.sort_by
      [
        ["Name","naturesoft_products_products.name"],
        ["Created At","naturesoft_products_products.created_at"]
      ]
    end
    
    def self.sort_orders
      [
        ["ASC","asc"],
        ["DESC","desc"]
      ]
    end
    
    #Filter, Sort
    def self.search(params)
      records = self.all
      
      #Search keyword filter
      if params[:keyword].present?
        params[:keyword].split(" ").each do |k|
          records = records.where("LOWER(CONCAT(naturesoft_products_products.name)) LIKE ?", "%#{k.strip.downcase}%") if k.strip.present?
        end
      end
      
      # for sorting
      sort_by = params[:sort_by].present? ? params[:sort_by] : "naturesoft_products_products.name"
      sort_orders = params[:sort_orders].present? ? params[:sort_orders] : "asc"
      records = records.order("#{sort_by} #{sort_orders}")
      
      return records
    end
    
    # enable/disable status
    def enable
			update_columns(status: "active")
		end
    
    def disable
			update_columns(status: "inactive")
		end
    
    # get newest default image
    def main_image
			return Image.new if images.empty?
			
			img = images.where(is_main: true).last
			return img.nil? ? images.last : img
		end
    
  end
end
