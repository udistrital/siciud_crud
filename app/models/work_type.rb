class WorkType < ApplicationRecord
  include Swagger::WorkTypeSchema
  has_and_belongs_to_many :research_creation_works
end
