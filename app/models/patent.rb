class Patent < ApplicationRecord
  include Swagger::PatentSchema

  belongs_to :category, class_name: 'Subtype', foreign_key: 'category_id', optional: true
  belongs_to :colciencias_call, optional: true
  belongs_to :patent_state, class_name: 'Subtype', foreign_key: 'patent_state_id', optional: true
  belongs_to :patent_type, class_name: 'Subtype', foreign_key: 'patent_type_id', optional: true
  belongs_to :research_group

  # Countries of obtaining
  has_and_belongs_to_many :geo_countries

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
