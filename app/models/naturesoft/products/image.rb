module Naturesoft::Products
  class Image < ApplicationRecord
    mount_uploader :image_url, Naturesoft::Products::ProductUploader
    belongs_to :product
  end
end