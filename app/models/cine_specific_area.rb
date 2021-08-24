class CineSpecificArea < ApplicationRecord
  include Swagger::CineSpecificAreaSchema

  belongs_to :cine_broad_area
  has_and_belongs_to_many :form_d_act_plans
  has_many :research_groups
end
