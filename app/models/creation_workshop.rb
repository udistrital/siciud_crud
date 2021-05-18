class CreationWorkshop < ApplicationRecord
  include Swagger::CreationWorkshopSchema

  belongs_to :category, class_name: 'Subtype', foreign_key: 'category_id', optional: true
  belongs_to :colciencias_call, optional: true
  belongs_to :participation, class_name: 'Subtype', foreign_key: 'participation_id', optional: true
  belongs_to :research_group

  belongs_to :geo_city, optional: true
  belongs_to :geo_state, optional: true
  belongs_to :geo_country

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
