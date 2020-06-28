class ProductTypology < ApplicationRecord
  has_many :arp_assignments
  has_many :product_types
end
