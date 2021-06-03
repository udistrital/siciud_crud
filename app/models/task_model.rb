class TaskModel < ApplicationRecord
  include Swagger::TaskModelSchema
  belongs_to :professional_role
  belongs_to :procedure
end
