class PublicationSerializer < AbstractProductSerializer
  attributes :id, :name, :project_title, :start_date,
             :final_date, :funding_institution, :url,
             :circulation_route, :target_audiences,
             :duration, :duration_type_id, :duration_type_name,
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

  def duration_type_name
    duration_type = self.object.duration_type
    if duration_type
      duration_type.st_name
    end
  end
end
