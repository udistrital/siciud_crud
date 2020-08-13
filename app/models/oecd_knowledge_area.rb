class OecdKnowledgeArea < ApplicationRecord
  has_many :oecd_knowledge_subareas
  validates :name, :code, uniqueness: true, exclusion: [nil, ""]
end
