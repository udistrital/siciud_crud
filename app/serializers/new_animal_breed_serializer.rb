class NewAnimalBreedSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :name, :category_id, :category_name, :ccb_ica_document,
             :cycle_type_id, :cycle_type_name, :date, :geo_city_id,
             :geo_city_name, :geo_country_id, :geo_country_name, :geo_state_id,
             :geo_state_name, :new_animal_breed_document,
             :observation, :petition_status_id, :petition_status_name,
             :active, :created_by, :updated_by, :created_at, :updated_at

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
