class OecdDiscipline < ApplicationRecord
  include Swagger::OecdDisciplineSchema

  belongs_to :oecd_knowledge_subarea
  has_and_belongs_to_many :research_groups, dependent: :destroy

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
