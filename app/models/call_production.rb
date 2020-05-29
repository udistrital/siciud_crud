class CallProduction < ApplicationRecord
  belongs_to :call
  belongs_to :production

  validates :production_id, uniqueness: {scope: :call_id,
                                   message: 'Record of production already exists'}
end
