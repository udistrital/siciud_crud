class GeoCountrySerializer < ActiveModel::Serializer
  attributes :id, :name, :iso2, :iso2, :iso3, :capital_name, :currency
end
