class ProposalBudgetSerializer < ActiveModel::Serializer
  attributes :id, :amount_request_cidc, :call_item_id,
             :counterparty, :amount_in_kind, :item_id, :item_name,
             :proposal_id, :subtotal, :active, :created_by, :updated_by,
             :created_at, :updated_at

  def item_id
    call_item = self.object.call_item
    if call_item
      call_item.item_id
    end
  end

  def item_name
    call_item = self.object.call_item
    if call_item
      item = call_item.item
      if item
        item.st_name
      end
    end
  end
end
