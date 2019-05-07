class Genre < ApplicationRecord
    #Relaciones con los diferentes modelos
    has_many :researchers
    #Validaciones de los campos obligatorios
    validates :name, presence: true

end
