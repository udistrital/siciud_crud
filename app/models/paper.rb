class Paper < ApplicationRecord
  include Swagger::PaperSchema

  belongs_to :category, class_name: 'Subtype', foreign_key: 'category_id', optional: true
  belongs_to :colciencias_call, optional: true
  belongs_to :paper_type, class_name: 'Subtype', foreign_key: 'paper_type_id', optional: true
  belongs_to :research_group

  # Publication place
  belongs_to :geo_city, optional: true
  has_one :geo_state, through: :geo_city
  has_one :geo_country, through: :geo_state

  # Participants
  has_many :int_participants, as: :producible
  has_many :ext_participants, as: :producible

  has_many :documents, as: :documentable

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
