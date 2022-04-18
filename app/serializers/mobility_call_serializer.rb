class MobilityCallSerializer < ActiveModel::Serializer
  attributes :id, :call_id, :call_name,
             :event_date, :event_edition_number, :event_name, :event_page,
             :geo_city_id, :geo_city_name, :geo_country_id, :geo_country_name,
             :geo_state_id, :geo_state_name, :is_organizer,
             :paper_name, :research_group_id, :research_group_name,
             :researcher_id, :oas_researcher_id,
             :active, :created_by, :updated_by, :created_at, :updated_at

  # GEOS

  def geo_city_name
    city = self.object.geo_city
    if city
      city.name
    end
  end

  def geo_country_name
    country = self.object.geo_country
    if country
      country.name
    end
  end

  def geo_state_name
    state = self.object.geo_state
    if state
      state.name
    end
  end

  def research_group_name
    research_group = self.object.research_group
    if research_group
      research_group.name
    end
  end

  def oas_researcher_id
    researcher = self.object.researcher
    if researcher
      researcher.oas_researcher_id
    end
  end
end
