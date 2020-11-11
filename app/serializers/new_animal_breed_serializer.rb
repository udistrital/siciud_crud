class NewAnimalBreedSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :name, :date, :observation, :cycle_type_id,
             :cycle_type_name, :petition_status_id, :petition_status_name,
             :category_id, :category_name, :research_group_id,
             :int_participants, :ext_participants, :geo_city_id,
             :geo_city_name, :geo_state_id, :geo_state_name, :geo_country_id,
             :geo_country_name

  def cycle_type_name
    cycle_type = self.object.cycle_type
    if cycle_type
      cycle_type.name
    end
  end

  def petition_status_name
    petition_status = self.object.petition_status
    if petition_status
      petition_status.name
    end
  end
end
