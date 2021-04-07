class NewAnimalBreedSerializer < AbstractProductSerializer
  attributes :id, :name, :category_id, :category_name,
             :colciencias_call_id, :colciencias_call_name,
             :colciencias_call_year, :cycle_type_id, :cycle_type_name, :date,
             :geo_city_id, :geo_city_name, :geo_country_id, :geo_country_name,
             :geo_state_id, :geo_state_name, :observation,
             :petition_status_id, :petition_status_name, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def cycle_type_name
    cycle_type = self.object.cycle_type
    if cycle_type
      cycle_type.st_name
    end
  end

  def petition_status_name
    petition_status = self.object.petition_status
    if petition_status
      petition_status.st_name
    end
  end
end
