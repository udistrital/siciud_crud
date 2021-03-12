class Book < ApplicationRecord
  include Swagger::BookSchema

  belongs_to :category
  belongs_to :editorial
  belongs_to :research_group

  # Publication place
  belongs_to :geo_city
  has_one :geo_state, through: :geo_city
  has_one :geo_country, through: :geo_state

  # Participants
  has_many :int_participants, as: :producible
  has_many :ext_participants, as: :producible

  has_many :documents, as: :documentable

  # Tracking inherited from ApplicationRecord, fields:
  # created_by and updated_by, see application_record.rb
end
