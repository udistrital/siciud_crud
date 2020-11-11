class GeoCountry < ApplicationRecord
  has_many :geo_states

  # Products
  has_many :books, through: :geo_states
  has_and_belongs_to_many :patents
end
