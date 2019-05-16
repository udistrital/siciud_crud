class ResearchSeedBed < ApplicationRecord
  belongs_to :state_seedbed
  belongs_to :snies
  belongs_to :researcher_focus
end
