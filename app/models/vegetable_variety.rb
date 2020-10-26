class VegetableVariety < ApplicationRecord
  belongs_to :cycle_type
  belongs_to :petition_status
  belongs_to :category
  belongs_to :research_group
end
