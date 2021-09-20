class GeoCountry < ApplicationRecord
  include Swagger::GeoCountrySchema
  has_many :geo_states

  # Products
  has_many :books, through: :geo_states
  has_and_belongs_to_many :patents

  #end point OTRI
  has_and_belongs_to_many :potential_markets
end
