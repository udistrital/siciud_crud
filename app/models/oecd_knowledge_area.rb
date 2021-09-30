class OecdKnowledgeArea < ApplicationRecord
  include Swagger::OecdKnowledgeAreaSchema

  has_many :oecd_knowledge_subareas
  has_many :research_groups
  has_many :historical_colciencias_ranks
  has_many :research_networks

  validates :name, :code, uniqueness: true

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
