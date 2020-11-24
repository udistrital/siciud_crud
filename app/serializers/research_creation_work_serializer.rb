class ResearchCreationWorkSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :title, :category_id, :category_name,
             :creation_and_selection_date, :geo_city_id, :geo_city_name,
             :geo_country_id, :geo_country_name, :geo_state_id, :geo_state_name,
             :knwl_spec_area_id, :knwl_spec_area_name, :nature_of_work,
             :observation, :registered_project_title, :url, :work_type_ids,
             :active, :created_by, :updated_by, :created_at, :updated_at


  def knwl_spec_area_name
    knwl_spec_area = self.object.knwl_spec_area
    if knwl_spec_area
      knwl_spec_area.name
    end
  end
end
