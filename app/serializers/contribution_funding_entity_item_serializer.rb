class ContributionFundingEntityItemSerializer < ActiveModel::Serializer
  attributes :id,:cashValue,:inKindValue,:contribution_id,:item_category
  def item_category 
    self.object.item_category
  end
end
