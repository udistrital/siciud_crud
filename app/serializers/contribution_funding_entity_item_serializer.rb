class ContributionFundingEntityItemSerializer < ActiveModel::Serializer
  attributes :id, :cashValue, :inKindValue, :contribution_id, :item_category, :remainingCashValue, :remainingKindValue,
             :asignedCashValue, :asignedKindValue

  def item_category
    self.object.item_category
  end

  def remainingCashValue
    self.object.cashValue - self.object.contribution_rp_items.sum(:cashValue)
  end

  def remainingKindValue
    self.object.inKindValue - self.object.contribution_rp_items.sum(:inKindValue)
  end

  def asignedCashValue
    self.object.contribution_rp_items.sum(:cashValue)
  end

  def asignedKindValue
    self.object.contribution_rp_items.sum(:inKindValue)
  end
end
