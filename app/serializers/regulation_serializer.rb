class RegulationSerializer < AbstractProductSerializer
  attributes :id, :title, :date_of_publication, :issuing_entity,
             :regulation_type_id, :regulation_type_name,
             :product_type_id, :product_type_name,
             :category_id, :category_name,
             :colciencias_call_id, :colciencias_call_name, :colciencias_call_year,
             :geo_city_id, :geo_city_name, :geo_country_id,
             :geo_country_name, :geo_state_id, :geo_state_name,
             :observation, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def product_type_name
    product_type = self.object.product_type
    if product_type
      product_type.st_name
    end
  end

  def regulation_type_name
    regulation_type = self.object.regulation_type
    if regulation_type
      regulation_type.st_name
    end
  end
end
