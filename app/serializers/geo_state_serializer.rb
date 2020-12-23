class GeoStateSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :geo_country_id
end
