class StateGroup < ApplicationRecord
    #Relaciones con los diferentes modelos
    has_many :research_groups
    #Validaciones de los campos obligatorios
    validates :name, presence: true
end
