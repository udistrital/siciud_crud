class BudgetSerializer < ActiveModel::Serializer
  attributes  :id, :description, :ally_name, :used_date, :budget_type_id, 
              :amount, :task_id, :created_by, :updated_by, :active, 
              :created_at, :updated_at

end
