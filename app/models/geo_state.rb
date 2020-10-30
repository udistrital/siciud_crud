class GeoState < ApplicationRecord
  belongs_to :geo_country

  has_many :geo_cities
end
