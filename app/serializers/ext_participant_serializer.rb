class ExtParticipantSerializer < AbstractProductSerializer
  attributes :id, :first_name, :last_name, :participant_type_id,
             :participant_type_name, :orcid_id, :producible_type,
             :producible_id

end
