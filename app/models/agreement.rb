class Agreement < ApplicationRecord
  belongs_to :faculty
  belongs_to :research_group
  belongs_to :agreement_status
  belongs_to :agreement_type
  belongs_to :funding_entity
end
