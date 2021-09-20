class TechnologyDescription < ApplicationRecord
  include Swagger::TechnologyDescriptionSchema
  belongs_to :procedure_request
end
