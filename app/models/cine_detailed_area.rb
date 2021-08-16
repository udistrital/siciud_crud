class CineDetailedArea < ApplicationRecord
  include Swagger::CineDetailedAreaSchema

  belongs_to :cine_specific_area

  has_many :knwl_plans, as: :knwl_area

  has_and_belongs_to_many :research_groups
end
