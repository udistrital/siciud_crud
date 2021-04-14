class ResearchFocus < ApplicationRecord
  include Swagger::ResearchFocusSchema

  has_and_belongs_to_many :research_groups
  has_and_belongs_to_many :research_seedbeds

  #Validaciones de los campos obligatorios
  validates :name, presence: true

end
