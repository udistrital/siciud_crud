class AbstractProductNewKnwGenSerializer < AbstractGeneralSerializer

  def category_name
    category = self.object.category
    if category
      category.name
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

  # def int_participants
  #   participants = self.object.int_participants
  #   if participants
  #     participants.map do |participant|
  #       {
  #           id: participant.id,
  #           participant_type_id: participant.participant_type.id,
  #           participant_type_name: participant.participant_type.name,
  #           researcher_id: participant.researcher.id,
  #           oas_researcher_id: participant.researcher.oas_researcher_id
  #       }
  #     end
  #   end
  # end
  #
  # def ext_participants
  #   participants = self.object.ext_participants
  #   if participants
  #     participants.map do |participant|
  #       {
  #           id: participant.id,
  #           first_name: participant.first_name,
  #           last_name: participant.last_name,
  #           participant_type_id: participant.participant_type.id,
  #           participant_type_name: participant.participant_type.name,
  #       }
  #     end
  #   end
  # end

  def participant_type_name
    participant_type = self.object.participant_type
    if participant_type
      participant_type.name
    end
  end
end
