class FormCActPlanSerializer < ActiveModel::Serializer
  attributes :id, :product_type_id, :description, :goal, :advanced_total, :order, :plan_type_id, :active, :created_by, :updated_by
  has_one :action_plan
end
