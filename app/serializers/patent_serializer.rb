class PatentSerializer < AbstractProductSerializer
  attributes :id, :title, :category_id, :category_name, :date_of_obtaining,
             :geo_country_ids, :industrial_publication_gazette, :observation,
             :patent_number, :patent_state_id, :patent_type_id,
             :patent_type_name,
             :patent_state_name, :research_group_id, :active, :created_by,
             :updated_by, :created_at, :updated_at

  def patent_type_name
    patent_type = self.object.patent_type
    if patent_type
      patent_type.st_name
    end
  end

  def patent_state_name
    patent_state = self.object.patent_state
    if patent_state
      patent_state.st_name
    end
  end
end
