class GeoCitySerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :latitude, :longitude, :geo_state_id
end
