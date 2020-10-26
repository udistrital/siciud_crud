class ExtParticipant < ApplicationRecord
  belongs_to :producible, polymorphic: true
  belongs_to :participant_type
end
