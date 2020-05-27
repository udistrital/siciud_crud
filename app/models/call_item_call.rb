class CallItemCall < ApplicationRecord
  belongs_to :call
  belongs_to :item_call
end
