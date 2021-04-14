class ExtParticipant < ApplicationRecord
  include Swagger::ExtParticipantSchema

  belongs_to :producible, polymorphic: true
  belongs_to :participant_type
end
