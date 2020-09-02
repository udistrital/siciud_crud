class OecdDiscipline < ApplicationRecord
  belongs_to :oecd_knowledge_subarea
  has_and_belongs_to_many :research_groups
end
