class PlantIndPrototypeSerializer < AbstractProductSerializer
  attributes :id, :plt_name, :plt_registration_number,
             :plt_date_of_elaboration, :category_id,
             :category_name, :colciencias_call_id, :colciencias_call_name,
             :colciencias_call_year, :geo_country_id, :geo_country_name,
             :observation, :plt_type_id, :plt_type_name,
             :funding_entity_ids,
             :research_group_id, :active, :created_by, :updated_by

  def plt_type_name
    plt_type = self.object.plt_type
    if plt_type
      plt_type.st_name
    end
  end
end
