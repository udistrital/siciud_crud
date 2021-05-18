class CreationWorkshopSerializer < AbstractProductSerializer
  attributes :id, :name, :start_date, :finish_date, :category_id, :category_name,
             :colciencias_call_id, :colciencias_call_name, :colciencias_call_year,
             :funding_institution, :geo_city_id, :geo_city_name, :geo_country_id,
             :geo_country_name, :geo_state_id, :geo_state_name, :observation,
             :organization_name, :participation_id, :participation_name,
             :research_group_id,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def participation_name
    participation = self.object.participation
    if participation
      participation.st_name
    end
  end
end
