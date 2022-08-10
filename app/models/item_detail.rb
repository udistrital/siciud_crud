class ItemDetail < ApplicationRecord
  include Swagger::ItemDetailSchema

  belongs_to :proposal_budget
  belongs_to :proposal
end
