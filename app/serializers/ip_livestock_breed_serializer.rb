class IpLivestockBreedSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :name, :category_id, :category_name, :certificate_ma_document,
             :consecutive_number_ma, :geo_city_id, :geo_city_name, :geo_state_id,
             :geo_state_name, :geo_country_id, :geo_country_name,
             :ip_livestock_breed_document, :observation, :publication_date,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
