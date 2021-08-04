class FormBActPlanSerializer < AbstractActionPlanSerializer
  attributes :id, :action_plan_id, :financing_type_id, :description,
             :goal_state_id, :goal_state_name, :goal_achieved, :order,
             :plan_type_id, :plan_type_name,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
