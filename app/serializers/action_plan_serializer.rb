class ActionPlanSerializer < ActiveModel::Serializer
  attributes :id, :execution_validity, :is_draft, :active, :created_by, :updated_by
  has_one :research_group
end
