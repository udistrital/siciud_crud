class CallSerializer < ActiveModel::Serializer
  attributes :id, :name, :callNumber, :registerDate, :description, :call_type_id,
             :call_user_role_id, :duration, :duration_type_id, :globalBudget, :maxBudgetPerProject,
             :startDate, :closingDate, :directedTowards
end
