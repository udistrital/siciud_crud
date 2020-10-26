class IntParticipantSerializer < ActiveModel::Serializer
  attributes :id
  has_one :producible
  has_one :research_group
  has_one :participant_type
end
