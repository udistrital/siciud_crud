class IntParticipant < ApplicationRecord
  include Swagger::IntParticipantSchema

  belongs_to :producible, polymorphic: true
  belongs_to :researcher
  belongs_to :participant_type, class_name: 'Subtype', foreign_key: 'participant_type_id'
end
