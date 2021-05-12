class InnovationSerializer < AbstractProductSerializer
  attributes :id, :name, :nit, :company_name, :date_of_obtaining, :product_type_id,
             :product_type_name,
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
end
