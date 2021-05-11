class AppropriationProcessSerializer < AbstractProductSerializer
  attributes :id, :name, :research_project_title, :start_date, :finish_date,
             :funding_institution, :category_id, :category_name,
             :colciencias_call_id, :colciencias_call_name, :colciencias_call_year,
             :product_type_id, :product_type_name,
             :observation, :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def product_type_name
    product_type = self.object.product_type
    if product_type
      product_type.st_name
    end
  end
end
