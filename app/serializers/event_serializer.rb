class EventSerializer < AbstractProductSerializer
  attributes :id, :eve_name, :eve_start_date, :eve_finish_date,
             :eve_organizers, :eve_entities, :category_id,
             :category_name, :colciencias_call_id, :colciencias_call_name,
             :colciencias_call_year, :eve_observation,
             :research_group_id, :eve_type_id,
             :active, :created_by, :updated_by
end
