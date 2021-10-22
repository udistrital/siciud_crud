class AffiliatedEntitySerializer < ActiveModel::Serializer
  attributes :id, :institution_type_id, :institution_type_name,
             :research_network_id, :research_network_name,
             :entity_id, :entity_name, :geo_country_id, :geo_country_name,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def research_network_name
    research_network = self.object.research_network
    if research_network
      research_network.name
    end
  end

  def entity_name
    entity = self.object.entity
    if entity
      entity.name
    end
  end

  def institution_type_name
    institution_type = self.object.institution_type
    if institution_type
      institution_type.st_name
    end
  end

  def geo_country_name
    geo_country = self.object.geo_country
    if geo_country
      geo_country.name
    end
  end
end
