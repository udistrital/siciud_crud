class FeContact < ApplicationRecord
  include Swagger::FeContactSchema

  belongs_to :funding_entity
end
