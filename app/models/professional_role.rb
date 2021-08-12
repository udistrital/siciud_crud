class ProfessionalRole < ApplicationRecord
    include Swagger::ProfessionalRoleSchema
    has_many :model_tasks
    has_many :otri_professionals
end
