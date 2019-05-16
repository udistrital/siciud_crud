class Snies < ApplicationRecord
    #Relaciones con los diferentes modelos
    has_many :researchers
    has_many :research_groups
    has_many :research_seed_beds

    #Validaciones de los campos obligatorios
    validates :name, presence: true
end
