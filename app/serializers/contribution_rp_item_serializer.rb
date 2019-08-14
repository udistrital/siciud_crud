class ContributionRpItemSerializer < ActiveModel::Serializer
  attributes :id, :cashValue, :inKindValue, :agreement_research_project_id, :item_category,
             :executedCash,:executedInKind,:remainingCash,:remainingInKind,:compromisedCash,:compromisedInKind

  def item_category
    self.object.contribution_funding_entity_item.item_category
  end
end
