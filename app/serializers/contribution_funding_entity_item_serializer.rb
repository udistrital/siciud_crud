class ContributionFundingEntityItemSerializer < ActiveModel::Serializer
  attributes :id, :cashValue, :inKindValue, :contribution_id, :item_category, :remainingCashValue, :remainingKindValue,
             :asignedCashValue, :asignedKindValue

  def item_category
    self.object.item_category
  end

  def remainingCashValue
    if self.object.contribution_rp_items
      (self.object.cashValue - self.object.contribution_rp_items.sum(:cashValue))
    else
      self.object.cashValue
    end
  end

  def remainingKindValue
    if self.object.contribution_rp_items
      self.object.inKindValue - self.object.contribution_rp_items.sum(:inKindValue)
    else
      self.object.inKindValue
    end
  end

  def asignedCashValue
    self.object.contribution_rp_items.sum(:cashValue)
  end

  def asignedKindValue
    self.object.contribution_rp_items.sum(:inKindValue)
  end
end
