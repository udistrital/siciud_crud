class OecdKnowledgeArea < ApplicationRecord
  has_many :oecd_knowledge_subareas, dependent: :destroy
  has_many :research_groups, dependent: :destroy
  has_many :historical_colciencias_ranks, dependent: :destroy

  validates :name, :code, uniqueness: true, exclusion: [nil, ""]

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
