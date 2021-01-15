class GroupState < ApplicationRecord
  include Swagger::GroupStateSchema
  
  has_many :research_groups

  validates :name, presence: true
end
