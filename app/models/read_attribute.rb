class ReadAttribute < ApplicationRecord
  include Swagger::ReadAttributeSchema
  belongs_to :task_attribute
  belongs_to :task_model
end
