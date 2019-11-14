class ArpAssignment < ApplicationRecord
  belongs_to :product_typology
  belongs_to :agreement_research_project
  attribute :completedPercentage, :integer, default: 0
end
