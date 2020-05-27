class ItemCall < ApplicationRecord
  has_many :call_item_calls
  has_many :calls, through: :call_item_calls
end
