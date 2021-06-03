class ProfessionalRole < ApplicationRecord
    include Swagger::ProfessionalRoleSchema
    has_many :model_tasks
end
