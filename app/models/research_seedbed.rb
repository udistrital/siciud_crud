class ResearchSeedbed < ApplicationRecord
  has_one_attached :facultyActDocument
  has_one_attached :cidcActDocument
  belongs_to :state_seedbed
  belongs_to :snies
  belongs_to :researcher_focus
  has_and_belongs_to_many :faculties
  has_and_belongs_to_many :curricular_projects
  has_many :member_sedbeds
end
