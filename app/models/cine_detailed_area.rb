class CineDetailedArea < ApplicationRecord
  include Swagger::CineDetailedAreaSchema

  belongs_to :cine_specific_area

  has_and_belongs_to_many :form_d_act_plans
  has_and_belongs_to_many :research_groups
  has_and_belongs_to_many :research_networks
end
