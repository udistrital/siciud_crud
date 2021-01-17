class IntParticipant < ApplicationRecord
  include Swagger::IntParticipantSchema

  belongs_to :producible, polymorphic: true
  belongs_to :researcher
  belongs_to :participant_type
end
