class ExtParticipantSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name
  has_one :producible
  has_one :participant_type
end
