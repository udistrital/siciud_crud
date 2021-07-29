class FormAActPlanSerializer < ActiveModel::Serializer
  attributes :id, :product_type_id, :goal, :advanced_total, :order, :plan_type_id, :active, :created_by, :updated_by
  has_one :indicator
  has_one :action_plan
end
