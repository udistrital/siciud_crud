class OecdKnowledgeSubarea < ApplicationRecord
  belongs_to :oecd_knowledge_area
  validates :name, :code, uniqueness: true, exclusion: [nil, ""]
end
