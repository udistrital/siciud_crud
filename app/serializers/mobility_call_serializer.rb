class MobilityCallSerializer < ActiveModel::Serializer
  attributes :id, :call_id, :call_name,
             :event_date, :event_edition_number, :event_name, :event_page,
             :paper_name, :is_organizer,
             :active, :created_by, :updated_by, :created_at, :updated_at
  has_one :geo_city, optional: true
  has_one :geo_country
  has_one :geo_state, optional: true
  has_one :research_group

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
  validates :created_by, presence: true, allow_nil: false, on: :create
  validates :updated_by, presence: true, allow_nil: false, on: :update
  validate :validate_created_by, :validate_updated_by
end
