class HistoricalColcienciasRank < ApplicationRecord
  include Swagger::HistoricalColcienciasRankSchema

  belongs_to :colciencias_call
  belongs_to :colciencias_category
  belongs_to :research_group
  belongs_to :oecd_knowledge_area, optional: true
  belongs_to :oecd_knowledge_subarea, optional: true

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
