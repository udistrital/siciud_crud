class GeoState < ApplicationRecord
  belongs_to :geo_country

  has_many :geo_cities

  # Products
  has_many :books, through: :geo_cities
end
