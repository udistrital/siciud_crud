class ScientificCollectionSerializer < AbstractProductSerializer
  attributes :id, :name, :date_of_obtaining, :managing_institution_name,
             :curator_name, :last_conservatorship_date, :validity_and_use,
             :information_included, :category_id, :category_name,
             :colciencias_call_id, :colciencias_call_name, :colciencias_call_year,
             :geo_city_id, :geo_city_name, :geo_country_id,
             :geo_country_name, :geo_state_id, :geo_state_name,
             :observation, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
