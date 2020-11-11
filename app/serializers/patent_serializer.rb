class PatentSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :title, :category_id, :category_name, :date_of_obtaining,
             :ext_participants, :geo_country_ids,
             :industrial_publication_gazette, :int_participants, :observation,
             :patent_number, :patent_state_id, :patent_state_name, :research_group_id


  def patent_state_name
    patent_state = self.object.patent_state
    if patent_state
      patent_state.name
    end
  end
end
