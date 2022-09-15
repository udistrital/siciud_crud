class ItemDetail < ApplicationRecord
  include Swagger::ItemDetailSchema

  belongs_to :proposal_budget
  belongs_to :proposal
  belongs_to :source, class_name: 'Subtype', foreign_key: 'source_id', optional: true
end
