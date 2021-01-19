class Role < ApplicationRecord
    include Swagger::RoleSchema

    #Validaciones de los campos obligatorios
    validates :name, presence: true
end
