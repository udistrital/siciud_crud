class FormBActPlanSerializer < ActiveModel::Serializer
  attributes :id, :financing_type_id, :description, :goal_state_id, :goal_achieved, :order, :plan_type_id, :active, :created_by, :updated_by
  has_one :action_plan
end
