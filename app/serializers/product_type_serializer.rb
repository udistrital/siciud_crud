class ProductTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_typology_id, :indicator
end
