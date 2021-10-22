class FormEActPlanSerializer < AbstractActionPlanSerializer
  attributes :id, :action_plan_id, :type_description, :description,
             :inventoried, :inventory_plate, :plan_type_id, :plan_type_name,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
