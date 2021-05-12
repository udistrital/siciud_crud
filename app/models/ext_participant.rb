class ExtParticipant < ApplicationRecord
  include Swagger::ExtParticipantSchema

  belongs_to :producible, polymorphic: true
  belongs_to :participant_type, class_name: 'Subtype', foreign_key: 'participant_type_id'
end
