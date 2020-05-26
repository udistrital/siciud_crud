class Production < ApplicationRecord
  has_many :call_productions
  has_many :calls, through: :call_productions
end
