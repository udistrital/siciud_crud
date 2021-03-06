class ExtensionProjectSerializer < AbstractProductSerializer
  attributes :id, :institution, :administrative_act,
             :project_name, :start_date, :name_ext_project,
             :final_date, :community_name,
             :category_id, :category_name,
             :colciencias_call_id, :colciencias_call_name, :colciencias_call_year,
             :geo_city_id, :geo_city_name, :geo_country_id,
             :geo_country_name, :geo_state_id, :geo_state_name,
             :observation, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
