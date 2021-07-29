class FormDActPlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :goal_state_id, :goal_achieved, :order, :plan_type_id, :active, :created_by, :updated_by
  has_one :action_plan
end
