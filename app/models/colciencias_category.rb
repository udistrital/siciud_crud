class ColcienciasCategory < ApplicationRecord
    has_many :historical_colciencias_ranks
    #Validaciones de los campos obligatorios
    validates :name, presence: true, uniqueness: true
end
