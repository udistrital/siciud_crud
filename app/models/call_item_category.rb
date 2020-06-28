class CallItemCategory < ApplicationRecord
  belongs_to :call
  belongs_to :item_category

  validates :percentage, :maximum_percentage, presence: true, numericality: {:greater_than => 0,
                                                                             :less_than_or_equal_to => 100}
  validates :item_category_id, uniqueness: {scope: :call_id, message: 'Record of items already exists'}
end
