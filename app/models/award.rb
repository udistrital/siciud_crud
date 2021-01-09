class Award < ApplicationRecord
  include Swagger::AwardSchema

  belongs_to :research_creation_work
end
