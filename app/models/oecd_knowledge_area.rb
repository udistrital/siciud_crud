class OecdKnowledgeArea < ApplicationRecord
  has_many :oecd_knowledge_subareas
  has_many :research_groups

  validates :name, :code, uniqueness: true, exclusion: [nil, ""]
end
