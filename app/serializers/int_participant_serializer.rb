class IntParticipantSerializer < ActiveModel::Serializer
  attributes :id
  has_one :producible
  has_one :researcher
  has_one :participant_type
end
