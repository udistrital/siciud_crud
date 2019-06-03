class Period < ApplicationRecord
  has_and_belongs_to_many :ResearchGroup
  has_many :research_project_plans
  has_many :researcher_formation_plans
  has_many :result_transfers

end
