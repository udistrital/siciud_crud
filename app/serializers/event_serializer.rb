class EventSerializer < AbstractProductSerializer
  attributes :id, :eve_name, :eve_start_date, :eve_finish_date,
             :eve_organizers, :eve_entities, :category_id,
             :category_name, :colciencias_call_id, :colciencias_call_name,
             :colciencias_call_year, :eve_observation,
             :geo_city_id, :geo_city_name, :geo_country_id,
             :geo_country_name, :geo_state_id, :geo_state_name,
             :research_group_id, :eve_type_id, :participation_id,
             :participation_name,
             :active, :created_by, :updated_by

  def participation_name
    participation = self.object.participation
    if participation
      participation.st_name
    end
  end
end
