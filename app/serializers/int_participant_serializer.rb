class IntParticipantSerializer < AbstractProductSerializer
  attributes :id, :participant_type_id, :participant_type_name,
             :researcher_id, :oas_researcher_id

  def oas_researcher_id
    researcher = self.object.researcher
    if researcher
      researcher.oas_researcher_id
    end
  end
end
