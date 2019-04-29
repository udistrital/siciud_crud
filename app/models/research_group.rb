class ResearchGroup < ApplicationRecord
  belongs_to :faculty
  belongs_to :curricular_project
  belongs_to :state_group
  belongs_to :snies
  belongs_to :research_focus
end
