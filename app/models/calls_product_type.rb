class CallsProductType < ApplicationRecord
  belongs_to :call
  belongs_to :product_type

  validates :product_type_id, uniqueness: {scope: :call_id,
                                         message: 'Record of production already exists'}
end
