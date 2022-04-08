class MobilityCallSerializer < ActiveModel::Serializer
  attributes :id, :event_name, :event_edition_number, :event_date, :paper_name, :is_organizer, :event_page, :active, :created_by, :updated_by
  has_one :call
  has_one :geo_city
  has_one :geo_country
  has_one :geo_state
  has_one :research_group
end
