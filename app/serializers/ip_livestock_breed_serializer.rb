class IpLivestockBreedSerializer < AbstractProductSerializer
  attributes :id, :name, :category_id, :category_name, :colciencias_call_id,
             :colciencias_call_name, :colciencias_call_year,
             :consecutive_number_ma, :geo_city_id, :geo_city_name, :geo_state_id,
             :geo_state_name, :geo_country_id, :geo_country_name,
             :observation, :publication_date, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
