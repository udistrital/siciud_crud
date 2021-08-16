class KnwlPlanSerializer < ActiveModel::Serializer
  attributes :id, :form_d_act_plan_id, :knwl_area_type, :knwl_area_id,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
