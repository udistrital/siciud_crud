class BookSerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :title, :category_id, :category_name,
             :editorial_id, :editorial_name, :geo_city_id, :geo_city_name,
             :geo_country_id, :geo_country_name, :geo_state_id, :geo_state_name,
             :isbn, :observation, :publication_date, :research_group_id, :url,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
