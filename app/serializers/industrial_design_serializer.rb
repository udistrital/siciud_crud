class IndustrialDesignSerializer < AbstractProductSerializer
  attributes :id, :ind_dsg_registration_number,
             :ind_dsg_registration_title, :ind_dsg_date_of_obtaining,
             :ind_dsg_industrial_publication_gazette, :category_id,
             :category_name, :colciencias_call_id, :colciencias_call_name,
             :colciencias_call_year, :geo_country_id, :geo_country_name,
             :observation, :research_group_id,
             :active, :created_by, :updated_by
end
