class CallSerializer < ActiveModel::Serializer
  attributes :callNumber, :registerDate, :description, :call_type_id, :call_user_role_id,
             :duration, :globalBudget, :maxBudgetPerProject, :startDate, :closingDate,
             :directedTowards
end
