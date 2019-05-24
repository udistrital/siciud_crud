class ResearchSeedbed < ApplicationRecord
  has_one_attached :facultyActDocument
  has_one_attached :cidcActDocument
  belongs_to :state_seedbed
  belongs_to :snies
  belongs_to :researcher_focus
  
# has_many :member_sed_beds
end
