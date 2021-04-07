class IntegratedCircuitDiagramSerializer < AbstractProductSerializer
  attributes :id, :icd_registration_number, :icd_registration_title,
             :icd_date_of_obtaining, :category_id, :category_name,
             :colciencias_call_id, :colciencias_call_name, :colciencias_call_year,
             :geo_country_id, :geo_country_name, :observation, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
