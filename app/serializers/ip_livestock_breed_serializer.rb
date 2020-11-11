class IpLivestockBreedSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :name, :publication_date, :consecutive_number_ma, :observation,
             :category_id, :category_name, :research_group_id, :int_participants,
             :ext_participants, :geo_city_id, :geo_city_name, :geo_state_id,
             :geo_state_name, :geo_country_id, :geo_country_name
end
