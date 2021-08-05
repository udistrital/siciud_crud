class TaskAttribute < ApplicationRecord
  include Swagger::TaskAttributeSchema

  belongs_to :attribute_sub_type, class_name: :SubType, optional: true
  belongs_to :task_model
end
