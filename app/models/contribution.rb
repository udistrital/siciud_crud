class Contribution < ApplicationRecord
  belongs_to :funding_entity
  belongs_to :agreement
  has_many :contribution_funding_entity_items
end
