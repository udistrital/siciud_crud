class OecdKnowledgeSubarea < ApplicationRecord
  belongs_to :oecd_knowledge_area
  has_many :research_groups

  validates :name, :code, uniqueness: true, exclusion: [nil, ""]
end
