class CallsProductType < ApplicationRecord
  belongs_to :call
  belongs_to :product_type
  belongs_to :required_type, optional: true

  validates :product_type_id, uniqueness: {scope: :call_id,
                                         message: 'Record of production already exists'}
end
