class PotentialMarket < ApplicationRecord
  include Swagger::PotentialMarketSchema
  belongs_to :procedure_request
  has_and_belongs_to_many :segments,
                          join_table: 'potential_markets_segments',
                          class_name: 'Subtype'

  has_and_belongs_to_many :geo_countries
end
