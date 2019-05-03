class ResearchGroup < ApplicationRecord
  has_and_belongs_to_many :faculties
  has_and_belongs_to_many :curricular_projects

  has_and_belongs_to_many :research_focuses

  belongs_to :state_group
  belongs_to :snies
#  belongs_to :research_focus
  has_many :members
  validates :name,:acronym,:description,:curricular_project_ids,:cidcRegistrationDate,
        :cidcActNmber,:facultyActNumber,:facultyRegistrationDate,:state_group_id,
        :snies_id,:email, presence: true
  
end
