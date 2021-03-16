class PatentSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :title, :category_id, :category_name, :date_of_obtaining,
             :geo_country_ids, :industrial_publication_gazette, :observation,
             :patent_number, :patent_state_id,
             :patent_state_name, :research_group_id, :active, :created_by,
             :updated_by, :created_at, :updated_at

  def patent_state_name
    patent_state = self.object.patent_state
    if patent_state
      patent_state.st_name
    end
  end
end
