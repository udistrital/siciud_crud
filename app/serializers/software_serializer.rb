class SoftwareSerializer < AbstractProductSerializer
  attributes :id, :sof_registration_number, :sof_product_title,
             :sof_date_of_obtaining, :sof_description, :category_id,
             :category_name, :colciencias_call_id, :colciencias_call_name,
             :colciencias_call_year,
             :geo_city_id, :geo_city_name, :geo_country_id,
             :geo_country_name, :geo_state_id, :geo_state_name,
             :observation, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
