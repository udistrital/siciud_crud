class MobilityCallSerializer < ActiveModel::Serializer
  attributes :id, :call_id, :call_name,
             :event_date, :event_edition_number, :event_name, :event_page,
             :paper_name, :is_organizer,
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
end
