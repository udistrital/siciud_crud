class ItemDetailSerializer < ActiveModel::Serializer
  attributes :id, :description, :justification, :estimated_date,
             :proposal_budget_id, :proposal_id,
             :quantity, :individual_cost, :subtotal, :source_id, :source_name,
             :state_id, :state_name, :requested_amount, :executed_amount, :balance, :approved,
             :payments, :notified_due_to_expire, :notified_expired,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def source_name
    source = self.object.source
    if source
      source.st_name
    end
  end

  def state_name
    state = self.object.state
    if state
      state.st_name
    end
  end
end
