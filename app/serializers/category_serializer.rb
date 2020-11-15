class CategorySerializer < AbstractProductNewKnwGenSerializer
  attributes :id, :name, :product_type_id, :product_type_name,
             :product_typology_id, :product_typology_name
end
