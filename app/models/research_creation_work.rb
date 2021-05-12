class ResearchCreationWork < ApplicationRecord
  include Swagger::ResearchCreationWorkSchema

  belongs_to :category, class_name: 'Subtype', foreign_key: 'category_id', optional: true
  belongs_to :colciencias_call, optional: true
  belongs_to :knwl_spec_area, class_name: 'Subtype', foreign_key: 'knwl_spec_area_id', optional: true
  belongs_to :nature, class_name: 'Subtype', foreign_key: 'nature_id', optional: true
  belongs_to :research_group

  has_many :awards
  has_and_belongs_to_many :work_types,
                          join_table: 'research_creation_works_work_types',
                          class_name: 'Subtype'

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
  validates :created_by, presence: true, allow_nil: false
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
