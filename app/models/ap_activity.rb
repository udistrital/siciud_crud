class ApActivity < ApplicationRecord
  include Swagger::ApActivitySchema

  belongs_to :ap_specific_goal
end
