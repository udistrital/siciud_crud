class ObjectiveSerializer < ActiveModel::Serializer
  attributes :id, :description, :parent_id,
             :proposal_id, :active, :created_by,
             :updated_by, :created_at, :updated_at
end
