class AbstractProductNewKnwGenSerializer < AbstractGeneralSerializer

  def category_name
    category = self.object.category
    if category
      category.st_name
    end
  end

  def colciencias_call_name
    colciencias_call = self.object.colciencias_call
    if colciencias_call
      colciencias_call.name
    end
  end

  def colciencias_call_year
    colciencias_call = self.object.colciencias_call
    if colciencias_call
      colciencias_call.year
    end
  end

  def editorial_name
    editorial = self.object.editorial
    if editorial
      editorial.name
    end
  end

  # GEOS

  def geo_city_name
    # Publication city name
    city = self.object.geo_city
    if city
      city.name
    end
  end

  def geo_state_id
    # Publication state id
    state = self.object.geo_state
    if state
      state.id
    end
  end

  def geo_state_name
    # Publication state name
    state = self.object.geo_state
    if state
      state.name
    end
  end

  def geo_country_id
    # Publication country id
    country = self.object.geo_country
    if country
      country.id
    end
  end

  def geo_country_name
    # Publication country name
    country = self.object.geo_country
    if country
      country.name
    end
  end

  # PARTICIPANTS

  def participant_type_name
    participant_type = self.object.participant_type
    if participant_type
      participant_type.st_name
    end
  end
end
