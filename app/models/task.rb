class Task < ApplicationRecord
  include Swagger::TaskSchema
  belongs_to :otri_professional
  belongs_to :task_model
  belongs_to :request_has_procedure

  has_many :budgets
  has_many :task_has_states
end
