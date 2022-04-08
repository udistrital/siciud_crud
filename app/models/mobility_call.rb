class MobilityCall < ApplicationRecord
  belongs_to :call
  belongs_to :geo_city
  belongs_to :geo_country
  belongs_to :geo_state
  belongs_to :research_group
end
