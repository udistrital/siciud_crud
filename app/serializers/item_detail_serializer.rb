class ItemDetailSerializer < ActiveModel::Serializer
  attributes :id, :description, :justification, :estimated_date,
             :proposal_budget_id, :proposal_id,
             :quantity, :individual_cost, :subtotal,
             :active, :created_by, :updated_by, :created_at, :updated_at
end
