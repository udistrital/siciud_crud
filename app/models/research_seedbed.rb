class ResearchSeedbed < ApplicationRecord
  has_one_attached :facultyActDocument
  has_one_attached :cidcActDocument
  belongs_to :state_seedbed
  belongs_to :snies
  has_and_belongs_to_many :faculties
  has_and_belongs_to_many :curricular_projects
  has_many :member_seedbeds
  has_many :plan_periods

    validates :name,:acronym ,:cidcRegistrationDate,
        :cidcActNumber,:facultyActNumber,:facultyRegistrationDate,:state_seedbed_id,
        :snies_id,:mail, presence: true
  
end
