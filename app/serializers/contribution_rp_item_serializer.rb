class ContributionRpItemSerializer < ActiveModel::Serializer
  attributes :id, :cashValue, :inKindValue, :agreement_research_project_id,
             :executedCash,:executedInKind,:remainingCash,:remainingInKind,:compromisedCash,:compromisedInKind,
             :item_category_id
             #:item_category,


  def item_category_id
   self.object.contribution_funding_entity_item.item_category.id
  end
end
