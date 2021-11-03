class OecdKnowledgeSubarea < ApplicationRecord
  include Swagger::OecdKnowledgeSubareaSchema

  belongs_to :oecd_knowledge_area
  has_many :research_groups
  has_many :historical_colciencias_ranks
  has_many :research_networks

  has_and_belongs_to_many :form_d_act_plans

  # validates :name, :code, uniqueness: true, exclusion: [nil, ""]

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false
  validate :validate_created_by, :validate_updated_by
end
