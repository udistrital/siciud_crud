class CineSpecificArea < ApplicationRecord
  include Swagger::CineSpecificAreaSchema

  belongs_to :cine_broad_area
  has_many :research_groups
end
