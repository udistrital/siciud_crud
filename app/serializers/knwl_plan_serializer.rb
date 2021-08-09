class KnwlPlanSerializer < ActiveModel::Serializer
  attributes :id, :active, :created_by, :updated_by
  has_one :knwl_area
  has_one :form_d_act_plan
end
