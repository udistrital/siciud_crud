class TaskModel < ApplicationRecord
  include Swagger::TaskModelSchema
  belongs_to :professional_role
  belongs_to :procedure

  has_many :actual_tasks, class_name: :NextTask, foreign_key: 'actual_task'
  has_many :following_tasks, class_name: :NextTask, foreign_key: 'following_task'
end
