class ProductTypology < ApplicationRecord
  include Swagger::ProductTypologySchema

  has_many :arp_assignments
  has_many :product_types
end
