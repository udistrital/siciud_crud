class CallsProductType < ApplicationRecord
  belongs_to :call
  belongs_to :product_type
end
