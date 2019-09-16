class ContributionFundingEntityItemSerializer < ActiveModel::Serializer
  attributes :id, :cashValue, :inKindValue, :contribution_id, :remainingCashValue, :remainingKindValue,
             :asignedCashValue, :asignedKindValue,:item_category_id
             #:item_category, 

  #def item_category
    #self.object.item_category
  #end

  def remainingCashValue
    if self.object.contribution_rp_items.sum(:cashValue)
      (self.object.cashValue - self.object.contribution_rp_items.sum(:cashValue))
    else
      self.object.cashValue
    end
  end

  def remainingKindValue
    if self.object.contribution_rp_items.sum(:inKindValue)
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
