class WorkType < ApplicationRecord
  has_and_belongs_to_many :research_creation_works
end
