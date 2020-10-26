class IntParticipant < ApplicationRecord
  belongs_to :producible, polymorphic: true
  belongs_to :research_group
  belongs_to :participant_type
end
