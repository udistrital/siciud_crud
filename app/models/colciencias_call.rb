class ColcienciasCall < ApplicationRecord
  include Swagger::ColcienciasCallSchema

  has_many :historical_colciencias_ranks
  #Validaciones de los campos obligatorios 
  validates :name, presence: true
  validates :year, presence: true

end
