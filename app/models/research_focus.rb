class ResearchFocus < ApplicationRecord
  #Relaciones con los diferentes modelos
  belongs_to :faculty
  has_many :research_groups
  has_and_belongs_to_many :research_groups
  has_many :research_seed_beds

  #Validaciones de los campos obligatorios
  validates :name, presence: true

end
