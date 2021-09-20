class TaskHasState < ApplicationRecord
  include Swagger::TaskHasStateSchema
  belongs_to :task
  belongs_to :states, class_name: 'Subtype', foreign_key: 'state_id'
end
