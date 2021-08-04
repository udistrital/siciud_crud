class FormCActPlanSerializer < AbstractActionPlanSerializer
  attributes :id, :action_plan_id, :advanced_total, :description,
             :goal, :order, :plan_type_id, :plan_type_name, :product_type_id,
             :product_type_name, :active, :created_by, :updated_by,
             :created_at, :updated_at
end
