class NextTask < ApplicationRecord
  include Swagger::NextTaskSchema
  belongs_to :following_task, class_name: :TaskModel , optional: true
  belongs_to :actual_task, class_name: :TaskModel
end
