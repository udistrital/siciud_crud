class ProductType < ApplicationRecord
  belongs_to :product_typology
  has_many :calls_product_types
  has_many :calls, through: :calls_product_types
end
