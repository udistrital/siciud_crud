class Agreement < ApplicationRecord
  belongs_to :faculty
  belongs_to :agreement_status
  belongs_to :agreement_type
  has_and_belongs_to_many :research_groups
  has_many :contributions
  has_many :funding_entities,through: :contributions
end
