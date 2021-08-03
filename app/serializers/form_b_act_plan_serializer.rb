class FormBActPlanSerializer < ActiveModel::Serializer
  attributes :id, :action_plan_id, :financing_type_id, :description,
             :goal_state_id, :goal_state_name, :goal_achieved, :order,
             :plan_type_id, :plan_type_name,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def goal_state_name
    goal_state = self.object.goal_state
    if goal_state
      goal_state.st_name
    end
  end

  def plan_type_name
    plan_type = self.object.plan_type
    if plan_type
      plan_type.st_name
    end
  end
end
