class FunctionalApplication < ApplicationRecord
  include Swagger::FunctionalApplicationSchema
  belongs_to :procedure_request
end
