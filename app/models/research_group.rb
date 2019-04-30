class ResearchGroup < ApplicationRecord
  has_and_belongs_to_many :faculties
  belongs_to :curricular_project
  belongs_to :state_group
  belongs_to :snies
  belongs_to :research_focus
  has_many :members

end
